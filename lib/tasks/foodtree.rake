namespace :db do
  namespace :sync do
    desc "Sync food types"
    task :food_types => :environment do |t|
      #get all food types from foodtree api server
      resp = HTTParty.get "http://gate.foodtree.com/food_types"
      food_types = JSON.parse(resp.body)['food_types']
      p "got #{food_types.size} from http://gate.foodtree.com"
      
      #Iterate and generate thing objects with properties
      #save things and properties
      food_types.each do |ft|
        name = ft.delete('name')
        n = 1
        
        if Thing.where(:name => name).empty?
          puts "\t #{n} - Adding '#{name}' to OpenFood"
          thing = Thing.create!(:name => name)
          thing.properties.create(:name => 'foodtree_uuid', :value => ft.delete('uuid'))
          thing.properties.create(:name => 'open_food_uuid', :value => UUIDTools::UUID.timestamp_create().to_s)
        else
          p " #{n} - '#{name}' already in DB."      
        end
        
        n +=1
        
      end
      
    end
  end
end