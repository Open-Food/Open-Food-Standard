require 'csv'

namespace :db do
  namespace :sync do
    desc "Sync food types"
    task :foodtree_food_types => :environment do |t|
      #get all food types from foodtree api server
      resp = HTTParty.get "http://gate.foodtree.com/food_types"
      food_types = JSON.parse(resp.body)['food_types']
      p "got #{food_types.size} from http://gate.foodtree.com"
      
      #Iterate and generate thing objects with properties
      #save things and properties
      
      n = 1
      food_types.each do |ft|
        name = ft.delete('Name')

        
        if Thing.where(:name => name).empty?
          puts "\t #{n} - Adding '#{name}' to OpenFood"
          thing = Thing.create!(:name => name)
          thing.properties.create(:name => 'foodtree_uuid', :value => ft.delete('uuid'))
          thing.properties.create(:name => 'open_food_uuid', :value => UUIDTools::UUID.timestamp_create().to_s)
        else
          p " #{n} - '#{name}' already in DB."      
        end
        
        n += 1
        
      end
      
    end
    
    
    desc "Sync food types From CSV files in db/data/food-types/to-import"
    task :food_types => :environment do |t|
      Thing.delete_all
      Property.delete_all
      
      dir_path = "/home/maryam/DevEnv/Open-Food-Standard/db/data/food-types/to-import/"

      Dir.glob(dir_path+"*.csv") do |csv_file|
        # read all datasets that should be imported to open-data 
        things = CSV.read(csv_file)
        puts "Successfully loaded #{csv_file}"
        puts "========================================================================"
        
        header = things.delete_at(0)
        
        n = 1
        things.each do |th|
          
          attributes = Hash[*header.zip(th).flatten]
          name = attributes.delete('Name')
          
          if Thing.where(:name => name).empty?
            puts "\t #{n} - Adding '#{name}' to OpenFood"
             
            thing = Thing.create!(:name => name)
            
            attributes.each do |k,v|
              unless v.nil? || v.empty?
                thing.properties.create(:name => k, :value => v)  
              end
            end
            thing.properties.create(:name => 'open_food_uuid', :value => UUIDTools::UUID.timestamp_create().to_s)
            
          else
            p " #{n} - '#{name}' already in DB."
          end
          
          n += 1
          
        end
      end
      
    end
  end
end