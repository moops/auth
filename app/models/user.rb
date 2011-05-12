require 'digest/sha2'

class User < ActiveRecord::Base

  has_one :address
  validates_presence_of :first_name, :last_name, :user_name
  
  def initialize(fields)
    hashed_password = Digest::SHA2.hexdigest("EnN47qy8Uk0=#{fields['password']}")
    super({:first_name => fields[:first_name], :last_name => fields[:last_name], :user_name => fields[:user_name], :born_on => fields[:born_on], :salt => 'EnN47qy8Uk0=', :hashed_password => hashed_password, :authority => fields[:authority]})
  end

  def self.authenticate(name, password)
    logger.info("### user.authenticate name: #{name}, password: #{password}")
    p = User.find_by_user_name(name)
    p and p.hashed_password == Digest::SHA2.hexdigest(p.salt + password) ? p : nil
  end
    
  def age
    a = Date.today.year - born_on.year
    a -= 1 if Date.today < born_on + a.years
    a
  end

  def days_left
    #based on 84 year life expectancy 
    (born_on>>(84*12)) - Date.today
  end
end
