Factory.define(:thing) do |f|
  f.name { Faker::Lorem.words(1) }
end

Factory.define(:property) do |f|
  f.name "is a"
  f.value { Faker::Lorem.words(1) }
end
