# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.transaction do
  puts "Seeding Data ..."

  # Helper functions
  # def open_asset(file_name)
  #   File.open("./db/seed_assets/#{file_name}")
  # end

  # Only run on development (local) instances not on production, etc.
  # unless Rails.env.development?
  #   puts "Development seeds only (for now)!"
  #   exit 0
  # end

  # Let's do this ...

  ## USERS

  User.destroy_all

  5.times do
    password = Faker::Internet.email
    User.create({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password
    })
  end

  ## CATEGORIES

  puts "Finding or Creating Categories ..."

  cat1 = Category.find_or_create_by! name: 'Apparel'
  cat2 = Category.find_or_create_by! name: 'Electronics'
  cat3 = Category.find_or_create_by! name: 'Furniture'

  ## PRODUCTS

  puts "Re-creating Products ..."

  Product.destroy_all

  cat1.products.create!({
    name:  'Men\'s Classy shirt',
    description: Faker::Hipster.paragraph(4),
    image: 'apparel1.jpg',
    quantity: 10,
    price: 64.99
  })

  cat1.products.create!({
    name:  'Women\'s Zebra pants',
    description: Faker::Hipster.paragraph(4),
    image: 'apparel2.jpg',
    quantity: 18,
    price: 124.99
  })

  cat1.products.create!({
    name:  'Hipster Hat',
    description: Faker::Hipster.paragraph(4),
    image: 'apparel3.jpg',
    quantity: 4,
    price: 34.49
  })

  cat1.products.create!({
    name:  'Hipster Socks',
    description: Faker::Hipster.paragraph(4),
    image: 'apparel4.jpg',
    quantity: 8,
    price: 25.00
  })

  cat1.products.create!({
    name:  'Russian Spy Shoes',
    description: Faker::Hipster.paragraph(4),
    image: 'apparel5.jpg',
    quantity: 8,
    price: 1_225.00
  })

  cat1.products.create!({
    name:  'Human Feet Shoes',
    description: Faker::Hipster.paragraph(4),
    image: 'apparel6.jpg',
    quantity: 82,
    price: 224.50
  })


  cat2.products.create!({
    name:  'Modern Skateboards',
    description: Faker::Hipster.paragraph(4),
    image: 'electronics1.jpg',
    quantity: 40,
    price: 164.49
  })

  cat2.products.create!({
    name:  'Hotdog Slicer',
    description: Faker::Hipster.paragraph(4),
    image: 'electronics2.jpg',
    quantity: 0,
    price: 26.00
  })

  cat2.products.create!({
    name:  'World\'s Largest Smartwatch',
    description: Faker::Hipster.paragraph(4),
    image: 'electronics3.jpg',
    quantity: 32,
    price: 2_026.29
  })

  cat3.products.create!({
    name:  'Optimal Sleeping Bed',
    description: Faker::Hipster.paragraph(4),
    image: 'furniture1.jpg',
    quantity: 320,
    price: 3_052.00
  })

  cat3.products.create!({
    name:  'Electric Chair',
    description: Faker::Hipster.paragraph(4),
    image: 'furniture2.jpg',
    quantity: 2,
    price: 987.65
  })

  cat3.products.create!({
    name:  'Red Bookshelf',
    description: Faker::Hipster.paragraph(4),
    image: 'furniture3.jpg',
    quantity: 23,
    price: 2_483.75
  })


  ## REVIEWS

  puts "Re-creating Reviews ..."

  Review.destroy_all

  products = Product.all

  products.each do |product|
    5.times do
      product.reviews.create!({
        rating:  Faker::Number.between(1, 5),
        description: Faker::Hipster.sentence,
        user_id: Faker::Number.between(1, 5),
      })
    end
  end

  puts "DONE!"
end