class Thing < ActiveRecord::Base
  validates_presence_of :name
  has_many :properties

  def to_json(options = {})
    options[:include] = :properties
    super(options)
  end
end
