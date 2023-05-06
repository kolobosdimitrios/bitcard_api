require_relative '../lib/populator_fix.rb'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)



# User.destroy_all
# PurchaseProduct.destroy_all
# Product.destroy_all
# Purchase.destroy_all
# Token.destroy_all
# Shop.destroy_all

# User.create(
#     name: "Dimitris",
#     surname: "Kolovos",
#     username: "Jimmy1998",
#     user_key: "dFt3duLOqPZQ8feVwJOgddVOGxx2",
#     date_of_birth: "20/12/1970",
#     address: "Anastasiou Stamou 4",
#     email: "kolobosd98@gmail.com",
#     image: "",
#     points: 3000
# )

# Token.populate 50 do |token|
#     token.token = Faker::Alphanumeric.alpha(number: 64);
#     token.user_id = User.all.first.id
# end

# Shop.populate 50 do |shop|
#     shop.shop_name = Faker::Company.name,
#     shop.location_name = Faker::Address.community,
#     shop.location_latitude = Faker::Address.latitude,
#     shop.location_longitude = Faker::Address.longitude,
#     shop.description = Faker::Lorem.sentence,
#     shop.location_address = Faker::Address.street_address
# end


# Product.populate 15000 do |product|
#     product.name = Faker::Appliance.brand,
#     product.value = Faker::Number.decimal(l_digits: 2, r_digits: 2),
#     product.description = Faker::Appliance.equipment,
#     product.code = Faker::Barcode.ean(13) ,
#     product.barcode = Faker::Alphanumeric.alphanumeric(number: 25),
#     product.shops_id = Shop.all.sample.id
# end


# Purchase.populate 30 do |purchase|
#     purchase.tokens_id = Token.all.sample.id;
#     purchase.shops_id = Shop.all.sample.id
# end

# PurchaseProduct.populate 1500 do |purchase_product|
#     purchase = Purchase.all.sample
#     purchase_product.purchases_id = purchase.id;
#     purchase_product.products_id = Product.where(shops_id: purchase.shops_id).all.sample
# end

FavoriteShop.destroy_all

