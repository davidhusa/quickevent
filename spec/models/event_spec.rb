require 'spec_helper'

describe Event do
  let!(:event) { Factory(:event) }

  it 'should shorten a description through short_description' do
    event.description = "1"*100
    event.description.length.should == 100
    event.short_description.length.should == 35
  end

end
