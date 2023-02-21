require_relative '../lib/populator_fix.rb'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# Product.destroy_all
# Shop.destroy_all
# Token.destroy_all
# Purchase.destroy_all



# Shop.populate 3 do |shop|
#     shop.shop_name = Faker::Company.name,
#     shop.location_name = Faker::Address.community,
#     shop.location_latitude = Faker::Address.latitude,
#     shop.location_longitude = Faker::Address.longitude,
#     shop.description = Faker::Lorem.sentence,
#     shop.location_address = Faker::Address.street_address
# end




# Shop.all.each do |shop|

#     Product.populate 150 do |product|
#         product.name = Faker::Appliance.brand,
#         product.value = Faker::Number.decimal(l_digits: 2, r_digits: 2),
#         product.description = Faker::Appliance.equipment,
#         product.code = Faker::Barcode.ean(13) ,
#         product.barcode = Faker::Alphanumeric.alphanumeric(number: 25),
#         product.shops_id = shop.id
#     end

    
# end

# Token.destroy_all
# 5.times do 
#     tkn = Token.create(token: Faker::Code.ean, user_id: 1)
#     rand(1..15).times do
#         shop = Shop.all.sample
#         products = Product.all.select {|p| p.shops_id == shop.id }
#         p = products.sample
#         purchase = Purchase.create(tokens_id: tkn.id, shops_id: shop.id, products_id: p.id)
#     end
# end



