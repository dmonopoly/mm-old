# This file should contain all the record creation needed to seed the database with default values.
# Commands:
# rake db:reset - drops the db, recreates the db, and loads current schema into db
# rake db:schema:load - BEWARE: loads current schema into db and consequently destroys all records first!
# rake db:seed - load seed data; defaults to development
# rake db:seed RAILS_ENV=test - load seed data for the test db
# rake db:setup - set up database by running migrations
# rake db:test:purge - empties the test database.
# rake db:test:prepare - checks for pending migrations and warns you appropriately (fails when schema DNE)
# rake db:test:load - recreates the test database from the current db/schema.rb
# rake test:units, (...) - BEWARE: test db will be erased and re-generated from your development database when you run "rake"
# ruby -I test test/unit/article_test.rb

# NOTES:
# -"create" calls save, whereas "create!" calls "save!"
#   The difference? "create!" will raise an exception if the record is invalid.
# -"delete" directly deletes the record, whereas "destroy" triggers callbacks like before_destroy.
# - Use code like :restaurant=>Restaurant.all[0] for relationships. Apparently, Restaurant.find(1) won't work.
# - Don't bother with Factory(:user) in seeds.rb because the password is not working. Just do User.create().
#   (although using it in tests is fine)
# ---------------------------------------------------------------------------------

# Memories
Memory.find_or_create_by_content(:content => "I learned some Ruby / Rails stuff from Radar plus some about Radar's background.")
Memory.find_or_create_by_content(:content => "Twitter changed its design. It's really nice now - especially with the keyboard shortcuts, like g u to go to a user.")
Memory.find_or_create_by_content(:content => "I created the concept of vertical, multiple timelines in memorymap.")

puts "---found or created memories"

# Time Frames
# 1 per memory, for each day
if TimeFrame.count == 0
  TimeFrame.create(:representation => "12/15/2011", :first_date_type=>1,
                    :first_date => Date.parse('15-12-2011')) # 0
  TimeFrame.create(:representation => "12/13/2011", :first_date_type=>1,
                    :first_date => Date.parse('13-12-2011')) # 1
  TimeFrame.create(:representation => "12/11/2011", :first_date_type=>1,
                    :first_date => Date.parse('11-12-2011')) # 2
  # More general
  TimeFrame.create(:representation => "Semester 1 at USC", :first_date_type=>2, :second_date_type=>2,
                    :first_date => Date.parse('20-8-2011'), :second_date => Date.parse('15-12-2011')) # 3
  TimeFrame.create(:representation => "Schooling Years", :first_date_type=>2, :second_date_type=>2,
                    :first_date => Date.parse('1-8-1999'), :second_date => Date.parse('15-12-2011')) # 4
  puts "---created time frames"
else
  puts "---time frames already exist"
end

# MemoryTimeFrames
if MemoryTimeFrame.count == 0
  0.upto(2) do |i| # 3 memories
    if i == 0
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[0].id)
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[3].id)
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[4].id)
    elsif i == 1
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[1].id)
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[3].id)
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[4].id)
    elsif i == 2
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[2].id)
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[3].id)
      MemoryTimeFrame.create(:memory_id => Memory.all[i].id, :time_frame_id => TimeFrame.all[4].id)
    else
      puts "=("
    end
  end
  puts "---created memory time frames"
else
  puts "---memory time frames already exist"
end


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