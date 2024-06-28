Category.destroy_all
Admin.destroy_all

Admin.create(email: "admin@gmail.com", password: "123456")

10.times do |i|
  Category.create(name: "Category #{i + 1}", description: "Description #{i + 1}")
end

puts "Finished seeding"
