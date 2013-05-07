FactoryGirl.define do
  factory :news do
    factory :unpublished_news do
      title "An unpublished story"
      content "You shouldn't see this"
      author "Me"
    end
    factory :published_news do
      title "A published story"
      content "You should see this"
      author "Me"
      is_published true
      published_at Time.now
    end
  end
end