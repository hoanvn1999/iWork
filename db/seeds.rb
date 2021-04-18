# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
myself = User.new(email: "trungtran45612@gmail.com",
                      phone_number: "+84 77 540 0703",
                      full_name: "Trung Trần",
                      address: "Da Nang",
                      date_of_birth: "01-01-1998",
                      role: 1,
                      institution_id: rand(1..10),
                      activated: true,
                      password: "hoan@123",
                      password_confirmation: "hoan@123")
myself.avatar.attach(io: File.open("app/assets/images/avatars/myself.png"),
                         filename: "myself.jpg", content_type: "image/png")
myself.save

20.times do |n|
  user = User.new(email: "example-#{n+1}@example.com",
                  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
                  full_name: Faker::Name.name,
                  address: ["Da Nang", "Ha Noi", "HCM"].sample,
                  date_of_birth: Faker::Date.between(from: "1980-09-23", to: "2014-09-25"),
                  role: [0, 1, 2].sample,
                  institution_id: rand(1..10),
                  activated: true,
                  password: "hoan@123",
                  password_confirmation: "hoan@123")
  user.avatar.attach(io: File.open("app/assets/images/avatars/#{n}.jpg"),
                         filename: "avatar#{n}.jpg", content_type: "image/jpg")
  user.save
end

50.times do |n|
  job = Job.new(title: ["Livestream shop quần áo", "Livestream đồng hồ", "Đăng bài quảng cáo nội thất", "Tiếp thị sữa", "Bán quần áo", "Bán rau", "Livestream đồ điện tử"].sample,
                description: Faker::Quote.matz,
                number_of_staffs: rand(1..20),
                salary: rand(1000000..4000000),
                date: Faker::Date.between(from: "2021-06-06", to: "2022-09-25"),
                user_id: rand(1..21))
  job.job_image.attach(io: File.open("app/assets/images/jobs/#{rand(28)}.jpg"),
                            filename: "job#{n}.jpg", content_type: "image/jpg")
  job.save
end

5.times do |n|
  Booking.create!(job_id: rand(1..50),
                  renter_id: 1,
                  freelance_id: rand(2..20))
end

20.times do |n|
  Category.create!(name: Faker::IndustrySegments.industry)
end

20.times do |n|
  product = Product.new(user_id: 1,
                        category_id: rand(1..19),
                        name: Faker::IndustrySegments.sector,
                        description: Faker::Quote.most_interesting_man_in_the_world,
                        price: rand(100000..400000),
                        quantity: rand(5..50))
  product.product_image.attach(io: File.open("app/assets/images/spaces/cw-#{rand(73)}.jpg"),
                            filename: "job#{n}.jpg", content_type: "image/jpg")
  product.save
end


50.times do |n|
  p_id = rand(1..20)
  Invoice.create!(product_id: p_id,
                 quantity: rand(1..2),
                 current_price: Product.find_by(id: p_id).price)
end
