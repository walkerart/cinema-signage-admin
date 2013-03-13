require 'spec_helper'

describe Panel do

  it "should have a default type of 'color'" do
    subject.panel_type.should eq 'color'
  end

  it "should have a default color of white" do
    subject.background.should eq '#ffffff'
  end

  it "has a default position of zero" do
    subject.position.should be 0
  end
  
  it "has a panel_type of 'image' if background_file present" do
    subject.background_file_uid = "something"
    subject.panel_type.should eq "image"
  end

  it "has a panel_type of 'detail' if background_file present and text is present" do
    subject.background_file_uid = "something"
    subject.text = "something"
    subject.panel_type.should eq "detail"
  end

  it "has a panel_type of 'headline' if withou background file and text is present" do
    subject.background_file_uid = ""
    subject.text = "something"
    subject.panel_type.should eq "headline"
  end

  
end
