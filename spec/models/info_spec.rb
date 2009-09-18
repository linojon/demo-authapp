require File.dirname(__FILE__) + '/../spec_helper'

describe Info do
  it "should be valid" do
    Info.new.should be_valid
  end
end
