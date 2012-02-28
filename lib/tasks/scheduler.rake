desc "This task is called by the Heroku scheduler add-on"

task :sync_food_things => :environment do
  require 'csv'
  puts "Updating the Open Food Standards DB with new food 'things'"
  csv = CSV.read(Rails.root+"public/Food Types 7 Feb 2012.csv")
  header = csv.delete_at(0)
  csv.each do |row|
    name = row.delete_at(0)
    thing = Thing.find_or_initialize_by_name(name)
    if thing.new_record?
      thing.save
      puts "CREATED #{thing.name}"
      uuid = thing.properties.create(:name => 'open_food_uuid', :value => UUIDTools::UUID.timestamp_create().to_s)
      puts "created uuid for #{thing.name}: #{uuid.value}"
      row.each_with_index do |property, index|
        if property
          thing.properties.create(:name => header[index + 1], :value => property)
          puts "created property: #{header[index + 1]} with value: #{property}"
        end
      end
    else
      puts "FOUND #{thing.name}"
      row.each_with_index do |property, index|
      end 
    end
  end
  puts "done"
end
