FactoryGirl.define do
  factory :admin_user do
    email "testadmin@example.biz"
    password "password"
    password_confirmation "password"
  end
end