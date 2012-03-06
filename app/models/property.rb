class Property < ActiveRecord::Base
  belongs_to :food
  validates_presence_of :food, :name, :value
end
