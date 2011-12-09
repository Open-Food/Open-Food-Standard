class Property < ActiveRecord::Base
  belongs_to :thing  
  validates_presence_of :thing, :name, :value
end
