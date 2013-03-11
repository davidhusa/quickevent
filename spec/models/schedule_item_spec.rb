require 'spec_helper'

describe ScheduleItem do
  let!(:schedule_item) { Factory(:schedule_item) }

  it 'must have a start time' do
    item = ScheduleItem.new
    item.name = "ffff"
    item.should_not be_valid
  end 

  it 'must have a name' do
    item = ScheduleItem.new
    item.start = Time.now
    item.should_not be_valid
  end

  it 'is valid only with a name and start time' do
    item = ScheduleItem.new
    item.name = "ffff"
    item.start = Time.now
    item.should be_valid
  end

  it "should have an alias 'title' for 'name'" do
    schedule_item.title.should == schedule_item.name
  end

end
