require 'spec_helper'

describe Panel do

  its "default panel_type" do
    subject.panel_type.should == 'color'
  end

  its "default position" do
    subject.position.should == 0
  end

  its "default background" do
    subject.stub(:slide).and_return mock(Slide, color: '#FFFFFF')
    subject.background.should == "#FFFFFF"
  end
  
  it "has a panel_type of 'image' if background_file present" do
    subject.background_file_uid = "something"
    subject.panel_type.should eq "image"
  end

  it "has a panel_type of 'image' if background_file present and text is present" do
    subject.background_file_uid = "something"
    subject.text = "image"
    subject.panel_type.should eq "image"
  end

  it "has a panel_type of 'detail' if without background file and text is present" do
    subject.background_file_uid = ""
    subject.text = "something"
    subject.panel_type.should eq "detail"
  end
end
