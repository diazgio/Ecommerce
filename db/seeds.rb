Category.destroy_all

10.times do |i|
  Category.create(name: "Category #{i + 1}", description: "Description #{i + 1}")
end

puts "Finished seeding"
