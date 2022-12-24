# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all 
# Purchase.destroy_all
# Product.destroy_all
# Shop.destroy_all


# shop = Shop.create(
#     shop_name: 'Test Shop',
#       location_name: "Test location Name",
#        location_latitude: 23.456578464,
#         location_longitude: 23.456578464,
#          description: "This is a test description",
#           location_address: "Test location adress"
#         )

# Product.create(name: "Products name", value: 10.10, description: "Product description", code: "5201478963521", barcode: "5201478963521", shops_id: shop.id)

# User.all.each do |user|
#     10.times do
#         user.purchases.create(
#             price: FFaker::Number.decimal,
#             time: FFaker::Time.datetime,
#             pay_method: "cash",
#             user_key: user.user_id,
#             created_at: FFaker::Time.datetime,
#             updated_at: FFaker::Time.datetime,
#         )
#     end

# end

# Purchase.all.each do |purchase|
#     5.times do
#         purchase.products.create(
#             name: FFaker::Product.product_name,
#             value: FFaker::Number.decimal,
#             description: FFaker::Lorem.paragraph,
#             code: FFaker::Lorem.characters,
#             barcode: FFaker::Lorem.characters,
#             purchase_id: purchase.id,
#             created_at: FFaker::Time.datetime,
#             updated_at: FFaker::Time.datetime
#         )
#     end
# end
