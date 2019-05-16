FactoryBot.define do

  factory :user do
    email                 {"aaa@test.co.jp"}
    nickname              {"test"}
    password              {"aaaaaa"}
    password_confirmation {"aaaaaa"}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/files/rowing.jpg'), 'image/jpeg') }
  end

end
