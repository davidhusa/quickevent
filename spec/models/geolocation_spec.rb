require 'spec_helper'

describe Geolocation do
  let!(:geolocation) { Factory(:geolocation) }

  it 'should shorten a description through short_description' do
    geolocation.info = "1"*100
    geolocation.info.length.should == 100
    geolocation.short_info.length.should == 35
  end

  it 'must have a name' do
    location = Geolocation.new
    location.address = "123 What st."
    location.should_not be_valid
  end

  it 'must have an addess' do
    location = Geolocation.new
    location.name = "A place"
    location.should_not be_valid
  end

  it 'must have a name' do
    location = Geolocation.new
    location.address = "123 What st."
    location.name = "A place"
    location.should be_valid
  end

  it 'should update its longitude and latitude when saving a new address' do
    oldlong = geolocation.longitude
    oldlat = geolocation.latitude
    geolocation.address = "1600 Pennslyvania Ave NW, Washington, D.C."
    geolocation.save
    geolocation.longitude.should_not == oldlong
    geolocation.latitude.should_not == oldlat
  end

end
