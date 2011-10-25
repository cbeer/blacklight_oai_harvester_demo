require 'spec_helper'

describe Record do
  describe "terminology" do
    subject do
      Factory.build(:record)
    end

    it "should have a title" do
      subject.title.should == "African-American sheet music, 1850-1920 selected from the collection of Brown University."
    end

    it "should have a description" do
      subject.description.should be_a_kind_of(String)
    end
  end
end
