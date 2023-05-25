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

# for a in 1..15 do
#     shop = Shop.create(
#         shop_name: Faker::Company.name,
#         location_name: Faker::Address.street_address,
#         location_address: Faker::Address.street_address,
#         location_latitude: Faker::Address.latitude,
#         location_longitude: Faker::Address.longitude,
#         description: Faker::Lorem.sentence,
#     )
#     for i in 1..45 do
#         Product.create(
#             name: Faker::Appliance.brand,
#             value: Faker::Number.decimal(l_digits: 2, r_digits: 2),
#             description: Faker::Appliance.equipment,
#             code: Faker::Barcode.ean(13),
#             barcode: Faker::Alphanumeric.alphanumeric(number: 25),
#             shops_id: shop.id
#         )
#     end

# end

# Token.all.each do |token|
#     Purchase.create(
#         tokens_id: token.id,
#         shops_id: Shop.all.sample.id
#     )
# end

# Purchase.all.each do |purchase|
#     for i in 1..5 do
#         PurchaseProduct.create(
#             purchases_id: purchase.id,
#             products_id: Product.where(shops_id: purchase.shops_id).all.sample
#         )
#     end
# end

puts("Hello")
Purchase.populate 30 do |purchase|
    purchase.tokens_id = Token.all.sample.id;
    purchase.shops_id = Shop.all.sample.id
end

# PurchaseProduct.populate 1500 do |purchase_product|
#     purchase = Purchase.all.sample
#     purchase_product.purchases_id = purchase.id;
#     purchase_product.products_id = Product.where(shops_id: purchase.shops_id).all.sample
# end



# Shop.all.each do |shop|
#     working_hours = "{\"monday\":\"09:00-15:00||17:00-00:00\",\"tuesday\":\"09:00-15:00||17:00-00:00\",\"wednesday\":\"09:00-15:00||17:00-00:00\",\"thursday\":\"09:00-15:00||17:00-00:00\",\"friday\":\"09:00-15:00||17:00-00:00\",\"saturday\":\"09:00-15:00||17:00-00:00\",\"sunday\":\"-\"}"
#     contact_info = "{\"phones\":[\"6900000001\",\"6900000002\",\"6900000003\"],\"social_media\":{\"instagram\":\"test_shop_instagram\",\"facebook\":\"test_shop_facebook\",\"twitter\":\"test_shop_twitter\"}}"
#     shop.update(working_hours: working_hours, contact_info: contact_info)
# end


