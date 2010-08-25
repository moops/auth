class User < ActiveRecord::Base

  def self.authenticate(name, password)
    Person.find(:first, :conditions => [ "user_name = ? and password = ?", name, password ])
  end
    
  def get_age
    Date.today - born_on
  end
    
  def get_days_left
    #based on 84 year life expectancy 
    (born_on>>(84*12)) - Date.today
  end
end
