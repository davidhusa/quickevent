FactoryGirl.define do
  factory :event do
    title "Funcon"
    organizer "Me"
    twitter_hashtag "event"
    description "The most important event of the year."
    start Time.new(2015,11,11,11,11,11, "-07:00")
    self.end Time.new(2015,12,12,12,12,12, "-07:00") 
  end
end