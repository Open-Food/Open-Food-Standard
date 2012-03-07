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
        name = ft.delete('name')

        if Food.where(:name => name).empty?
          puts "\t #{n} - Adding '#{name}' to OpenFood"
          food = Food.create!(:name => name)
          food.add_property(:name => 'foodtree_uuid', :value => ft.delete('uuid'))
        end
        
        n += 1
        p "proceesed #{n} foods" if n%100 == 0
      end
     
    end
    
    
    desc "Sync food types From CSV files in db/data/food-types/to-import"
    task :food_types => :environment do |t|
      dir_path = "./db/data/food-types/to-import/"

      Dir.glob(dir_path+"*.csv") do |csv_file|
        # read all datasets that should be imported to open-data 
        foods = CSV.read(csv_file)
        puts "Successfully loaded #{csv_file}"
        puts "========================================================================"
        
        header = foods.delete_at(0)
        
        n = 1
        foods.each do |th|

          attributes = Hash[*header.zip(th).flatten]
          name = attributes.delete('Name')

          if Food.where(:name => name).empty?

            food = Food.create!(:name => name)
            attributes.each do |k,v|
              unless v.nil? || v.empty?
                food.add_property(:name => k, :value => v)
              end
            end
          end

          n += 1
          p "proceesed #{n} foods" if n%100 == 0

        end
      end
      
    end
  end
end
