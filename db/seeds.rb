# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


adam = User.create({ :id => 1, :name => 'adam lawrence', :user_name => 'adam', :salt => 'EnN47qy8Uk0=', :hashed_password => '72f919ce1a839f2383e60b488469553ef8d504c6cb6fb143088115dd68fe5201', :authority => 1, :born_on => '1969-07-09'})

addr = Address.create({ :id => 1, :user_id => 1, :address => '129 gorge rd e', :city => 'victoria', :state => 'bc', :country => 'canada', :zip => 'v9a1l1'})

