Open Food Api
=============

Open food documentation


API documentation (Work in progress)
------------------------------------

The general idea for the API is that we will create ‘things’ as a way to collect as much properties for a food, ingredient, farm, source, boat, etc.

A relationship can be created by simply adding a property to a ‘farm’ called ‘grows’ with the string value ‘tomato’.  The value of that property is not checked but another lookup can be performed to see information on a ‘tomato’

This was mainly created this way so that we can add ‘foodtree_id’, ‘freebase_id’ properties to items in the database.  We want to be able to associate links to existing sources of information rather than replicate or sync it across.

The primary focus was to gather as much data on an item, easily put it into one place and be able to query it.

http://open-food.heroku.com 

### Get Foods

HTTP GET to /foods.json

    curl http://open-foods.org/foods.json

Example response of 2 foods responded

    [{"created_at":"2012-03-08T20:48:26Z","name":"Alcohol","updated_at":"2012-03-08T20:48:26Z","uuid":"0dbaf2b6-6960-11e1-8308-12313933849a","properties":[{"created_at":"2012-03-08T20:48:27Z","name":"Classification: Family","updated_at":"2012-03-08T20:48:27Z","value":"Alcohol"}]},{"created_at":"2012-03-08T20:48:27Z","name":"Garlic","updated_at":"2012-03-08T20:48:27Z","uuid":"0dfeeef8-6960-11e1-8308-12313933849a","properties":[{"created_at":"2012-03-08T20:48:27Z","name":"Classification: Family","updated_at":"2012-03-08T20:48:27Z","value":"allium"}]}]

HTTP GET to /foods.json with name parameter to find a certain food

    curl http://open-foods.org/foods.json?name=apple

Example response

    [{"created_at":"2012-03-08T20:49:00Z","name":"Custard-apple","updated_at":"2012-03-08T20:49:00Z","uuid":"223aa0a6-6960-11e1-8308-12313933849a","properties":[{"created_at":"2012-03-08T20:49:01Z","name":"Classification: Family","updated_at":"2012-03-08T20:49:01Z","value":"fruit"}]}]


### Create a Food with properties

HTTP POST to /foods.json with a 'food' object containing a 'name'
attribute with properties.

Example json to post to create a new food:

    {“food” :  { “name” : “Apple”, 
      “properties” : [
    		{“name” : “color”, “value” : “green”}
    		{“name” : “type_of”, “value” : “fruit”}
    	]
    }

## Adding properties to an existing Food

HTTP POST to /foods/{food_uuid}/properties.json

Example json to post:

    { “properties” : 
    [
    	{“name” : “color”, “value” : “green”}
    	{“name” : “type_of”, “value” : “”}
    ] 
    }

## View a Food and it’s properties

HTTP GET to /foods/{food_uuid}.json

Example response with json representation of the food:

    {"created_at":"2012-03-08T20:50:21Z","name":"Black Pineapple","updated_at":"2012-03-08T20:50:21Z","uuid":"51f896b8-6960-11e1-8308-12313933849a","properties":[{"created_at":"2012-03-08T20:50:21Z","id":3166,"name":"Scientific name","updated_at":"2012-03-08T20:50:21Z","value":"Solanum lycopersicum"},{"created_at":"2012-03-08T20:50:21Z","id":3165,"name":"Simple Name","updated_at":"2012-03-08T20:50:21Z","value":"Tomato"},{"created_at":"2012-03-08T20:50:21Z","id":3164,"name":"Classification: Family","updated_at":"2012-03-08T20:50:21Z","value":"tomato"}]}

## Things to do

- As a developer be able to query what things have a property with a certain value. For example when I am viewing a ‘tomato’ I would like to see what things there are that have a property set of that.
- As a developer I would like to see all the different types of property names that can be applied for a thing
- Consider how duplicate information will be handled
- How will versions be handled and how will we know who added what data
    
- As a developer I would like to view the information Freebase has on an item I'm viewing. Similar to how the context examples work on simplegeo
	•	Example: If the food item being viewed has a freebase id then link to the page or API for more information


## Things to consider later
As open food we want to know who added data (and when)

As a developer I would like to query recipes associated with particular foods

A developer wants to use data about the top counties for production in certain foods (like tomatoes, leafy greens, eggs and pork) to estimate how far these foods travel on average to reach major population centers.


## More information

Visit [http://open-food.org](http://open-food.org) for more information
