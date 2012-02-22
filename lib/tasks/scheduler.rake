desc "This task is called by the Heroku scheduler add-on"

task :sync_food_things => :environment do
  require 'csv'
  puts "Updating the Open Food Standards DB with new food 'things'"
  csv = CSV.read(Rails.root+"public/Food Types 7 Feb 2012.csv")
  puts csv.first
  puts "done"
end
