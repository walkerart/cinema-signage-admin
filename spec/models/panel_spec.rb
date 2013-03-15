require 'spec_helper'

describe Panel do

  it "should have a default type of 'color'" do
    subject.panel_type.should eq 'color'
  end

  it "should receive a color from it's slide" do
    slide = Slide.create
    panel = slide.panels.create
    panel.slide.color.should eq '#ffffff'
    panel.color.should eq '#ffffff'
  end

  it "should have a default color of white" do
    slide = Slide.create
    panel = slide.panels.create
    panel.background.should eq '#ffffff'
  end

  it "has a default position of zero" do
    subject.position.should be 0
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

  it "should not render text if it has a background image" do
    subject.background_file_uid = "something"
    subject.text = "something"
    subject.panel_type.should eq "image"
  end
  
  it "should have no color if it has an image" do
    subject.stub :slide, mock(Slide, color: '#FFFFFF')
    subject.background_file_uid = "something"
    subject.text = "something"
    subject.color.should be_nil
  end

  it "should have it's slides color if it does not have an image" do
    subject.stub(:slide).and_return mock(Slide, color: '#FFFFFF')
    subject.background_file_uid = ""
    subject.text = "something"
    subject.color.should_not be_nil
    subject.color.should eq '#FFFFFF'
  end
end
