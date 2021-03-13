FactoryBot.define do
  factory :user do

  	factory :user1 do
  		name { "testuser1" }
  		email { Faker::Internet.free_email }
  		password { "password1" }
  		ticket { 20 }
  		is_banned { false }
  		discarded_at { nil }
  		trait :banned_user do
  			is_banned { true }
  		end
  		trait :deleted_user do
  			discarded_at { "2017-09-01 00:00:00" }
  		end
  		after(:create) do |user|
  			create :request, user: user
  		end
  	end

  	factory :user2 do
  		name { "testuser2" }
  		email { Faker::Internet.free_email }
  		password { "password2" }
  		ticket { 30 }
  		is_banned { false }
  		discarded_at { nil }
      after(:create) do |user|
        create :participant, user: user
      end
  	end

    factory :user3 do
      name { "testuser3" }
      email { Faker::Internet.free_email }
      password { "password3" }
      ticket { 30 }
      is_banned { false }
      discarded_at { nil }
    end
  end
end
