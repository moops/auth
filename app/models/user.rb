require 'digest/sha2'

class User < ActiveRecord::Base

  has_one :address
  validates_presence_of :name, :user_name, :salt, :hashed_password

  def self.authenticate(name, password)
    p = User.find_by_user_name(name)
    logger
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
