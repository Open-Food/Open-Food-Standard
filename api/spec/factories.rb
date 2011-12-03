Factory.define(:thing) do |f|
  f.name { Faker::Lorem.words(1) }
end
