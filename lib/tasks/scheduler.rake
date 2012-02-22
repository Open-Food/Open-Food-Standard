desc "This task is called by the Heroku scheduler add-on"

task :sync_food_things => :environment do
  require 'csv'
  puts "Updating the Open Food Standards DB with new food 'things'"
  csv = CSV.read(Rails.root+"public/Food Types 7 Feb 2012.csv")
  header = csv.delete_at(0)
  csv.each do |row|
    thing = Thing.find_or_create_by_name(row.first)
  end
  puts "done"
end
