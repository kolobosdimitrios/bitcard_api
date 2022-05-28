FactoryGirl.define do
    factory :user do
        name {FFaker::NameGR.first_name}
        surname {FFaker::NameGR.last_name}
        username {FFaker::Internet.user_name}
        user_id {FFaker::Lorem.characters}
        date_of_birth {FFaker::Time.date}
        address {FFaker::AddressGR.street_address}
        email {FFaker::Internet.email}
        created_at {FFaker::Time.datetime}
        updated_at {FFaker::Time.datetime}

    
    end

    
end