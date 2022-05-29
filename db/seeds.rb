# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Purchase.destroy_all
Product.destroy_all

FactoryGirl.create_list(:user, 100)

User.all.each do |user|
    10.times do
        user.purchases.create(
            price: FFaker::Number.decimal,
            time: FFaker::Time.datetime,
            pay_method: "cash",
            user_id: user.user_id,
            created_at: FFaker::Time.datetime,
            updated_at: FFaker::Time.datetime,
        )
    end

end

Purchase.all.each do |purchase|
    5.times do
        purchase.products.create(
            name: FFaker::Product.product_name,
            value: FFaker::Number.decimal,
            description: FFaker::Lorem.paragraph,
            code: FFaker::Lorem.characters,
            barcode: FFaker::Lorem.characters,
            purchase_id: purchase.id,
            created_at: FFaker::Time.datetime,
            updated_at: FFaker::Time.datetime
        )
    end
end
