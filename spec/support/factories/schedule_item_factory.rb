FactoryGirl.define do
  factory :schedule_item do
    name "Something happens"
    info "At this time a thing occurs"
    start Time.new(2015,11,11,11,11,11, "-07:00")
    self.end Time.new(2015,12,12,12,11,11, "-07:00")
    location "Room 2"
    end


  end
