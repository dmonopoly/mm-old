# # This file should contain all the record creation needed to seed the database with default values.
# # Commands:
# # rake db:reset - drops the db, recreates the db, and loads current schema into db
# # rake db:schema:load - BEWARE: loads current schema into db and consequently destroys all records first!
# # rake db:seed - load seed data; defaults to development
# # rake db:seed RAILS_ENV=test - load seed data for the test db
# # rake db:setup - set up database by running migrations
# # rake db:test:purge - empties the test database.
# # rake db:test:prepare - checks for pending migrations and warns you appropriately (fails when schema DNE)
# # rake db:test:load - recreates the test database from the current db/schema.rb
# # rake test:units, (...) - BEWARE: test db will be erased and re-generated from your development database when you run "rake"
# # ruby -I test test/unit/article_test.rb
# 
# # NOTES:
# # -"create" calls save, whereas "create!" calls "save!"
# #   The difference? "create!" will raise an exception if the record is invalid.
# # -"delete" directly deletes the record, whereas "destroy" triggers callbacks like before_destroy.
# # - Use code like :restaurant=>Restaurant.all[0] for relationships. Apparently, Restaurant.find(1) won't work.
# # - Don't bother with Factory(:user) in seeds.rb because the password is not working. Just do User.create().
# #   (although using it in tests is fine)
# # - For habtm relationship specification, do things like Factory(:meal, :restaurant_ids => [ r.id ]) with
# #   the r.id because specifying restaurant directly for some reason fails to specify the correct id
# # ---------------------------------------------------------------------------------
# 
# ## Creating the organizations; must have at least 2 for proceeding code to work
# [ "USC", "UCLA" ].each do |organization_name|
#   Organization.find_or_create_by_name(organization_name)
# end
# 
# puts "---found or created sections"
# 
# ## Creating the restaurants
# if Restaurant.count == 0
#   1.times do |n|
#     Factory.create(:restaurant, :organization => Organization.all[0], :name => "#{Organization.all[0].name} Restaurant #{n}")
#   end
#   1.times do |n|
#     Factory.create(:restaurant, :organization => Organization.all[1], :name => "#{Organization.all[1].name} Restaurant #{n}")
#   end
#   puts "---created restaurants"
# else
#   puts "---no need to create restaurants"
# end
# 
# ## Creating the meals
# # No meals are shared across restaurants with the following setup
# if Meal.count == 0
#   Restaurant.all.each do |r|
#     10.times do |n|
#       meal = Factory.create(:meal, :name => "#{r.name} Meal #{n}")
#       meal.restaurant_ids = [ r.id ]
#       meal.save
#     end
#   end
#   puts "---created meals"
# else
#   puts "---no need to create meals"
# end
# 
# ## Creating the occurrences (for meals)
# if Occurrence.count == 0
#   Meal.all.each do |m|
#     5.times do |n|
#       Factory.create(:occurrence, :meal => m)
#     end
#   end
#   puts "---created meal occurrences"
# else
#   puts "---no need to create meal occurrences"
# end
# 
# ## Creating the users
# 
# # 1 - superadmins
# User.create(:login=>"superadmin",:password=>"password",:password_confirmation=>"password",
#             :email=>"johndoe1@usc.edu",:role=>"superadmin",:active=>true)
# User.create(:login=>"superadmin2",:password=>"password",:password_confirmation=>"password",
#             :email=>"johndoe2@usc.edu",:role=>"superadmin",:active=>true)
# User.create(:login=>"superadmin3",:password=>"password",:password_confirmation=>"password",
#             :email=>"johndoe3@usc.edu",:role=>"superadmin",:active=>true)
# 
# # 2 - admins (per restaurant)
# # Results should be users with login "USC Restaurant 1 admin 1"
# # who has the organization USC & the restaurant USC Restaurant 1.
# # For now, an admin can only edit the restaurants he has, and the connection to his organization is left alone.
# # The headadmin could be introduced later.
# Organization.all.each do |organization|
#   organization.restaurants.all.each do |restaurant|
#     2.times do |n|
#       User.create(:login=>"#{restaurant.name} admin #{n}",:password=>"password",:password_confirmation=>"password",
#                   :email=>"admin#{rand}@usc.edu",:role=>"admin",:organization_ids=>[ organization.id ],
#                   :restaurant_ids=>[ restaurant.id ],:active=>true)
#     end
#   end
# end
# 
# puts "---dealt with moderators"
# 
# # 3 - customers
# if User.where(:role => "customer").count == 0
#   Organization.all.each do |organization| # At least 3 meals must exist
#     2.times do |n| User.create(:role => "customer",:password=>"password",:password_confirmation=>"password",
#       :login=>"#{organization.name} customer #{n}",:email=>"customer#{rand}@usc.edu",:organization_ids=>[ organization.id ],
#       :active=>true) # :meal_ids => [ Meal.all[0].id, Meal.all[1].id, Meal.all[2].id ], :active=>true) 
#     end
#   end
#   puts "---created customers"
# else
#   puts "---no need to create customers"
# end
# 
# # Creating the user_meals - the connection between customers and meals
# if UserMeal.count == 0
#   User.where(:role=>"customer").each do |user|
#     6.times do
#       m = Meal.all.sample
#       Factory.create(:user_meal, :user_id => user.id, :meal_id => m.id)
#     end
#   end
#   puts "---created user_meal connections"
# else
#   puts "---no need to user_meal connections"
# end
# 
# puts "---Done with seeds.rb!"