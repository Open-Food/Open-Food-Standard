class Property < ActiveRecord::Base
  belongs_to :food
  validates_presence_of :food, :name, :value

  def as_json(options)
    super(:except => [:food_id])
  end
end
