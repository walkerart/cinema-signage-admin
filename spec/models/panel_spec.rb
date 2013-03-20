require 'spec_helper'

def new_panel attrs={}
  Panel.new attrs, without_protection: true
end

def panel_with_lines n
  new_panel text: (["o"] * n).join("\r\n")
end

def single_panel
  new_panel.tap do |p|
    p.stub :slide, full_slide
  end
end

def black; '#000000' end
def white; '#ffffff' end
def white_slide; mock(Slide, background_color: white, panel_count: 3) end
def full_slide;  mock(Slide, background_color: white, panel_count: 1) end

describe Panel do
  before :each do
    Panel.any_instance.stub(:slide).and_return white_slide
  end

  context "IMAGE: with and image" do
    subject(:panel){ new_panel( background_file_uid: 'features/github.jpg') }
    its(:position) { should be 0 }
    its(:panel_type) { should eq 'image' }
    its(:text) { should be_blank }
    its(:color) { should eq white }
    its(:background) { should end_with('.jpg') }
  end

  context "TITLE: with 2 lines of text" do
    subject(:panel){ panel_with_lines(2) }
    its(:position) { should be 0 }
    its(:panel_type) { should eq 'title' }
    its(:text) { should_not be_blank }
    its(:color) { should eq black }
    its(:background) { should eq white }
  end

  context "DETAIL: with 5 lines of text" do
    subject(:panel){ panel_with_lines(5) }
    its(:position) { should be 0 }
    its(:panel_type) { should eq 'detail' }
    its(:text) { should_not be_blank }
    its(:color) { should eq white }
    its(:background) { should eq black }
  end

  context "FULL: only panel of slide" do
    subject(:panel){ single_panel }
    its(:panel_type){ should eq 'full' }
  end

  its "default panel_type" do
    subject.panel_type.should == 'color'
  end

  its "default position" do
    subject.position.should == 0
  end

  it "should not be valid with three lines of text" do
    subject = panel_with_lines 3
    subject.should_not be_valid
  end

  it "should not be valid with six lines of text" do
    subject = panel_with_lines 6
    subject.should_not be_valid
  end

  it "should not be valid with four lines of text" do
    subject = panel_with_lines 4
    subject.should_not be_valid
  end

  it "should be valid with 0,1,2,5 lines of text" do
    [0,1,2,5].each do |n|
      subject = panel_with_lines n
      subject.should be_valid
    end
  end

  its "default background" do
    subject.stub(:slide).and_return mock(Slide, background_color: '#FFFFFF')
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

  it "has a panel_type of 'title' if panel text has 1 lines" do
    panel = panel_with_lines 1
    panel.panel_type.should eq 'title'
  end

  it "has a panel_type of 'title' if panel text has 2 lines" do
    panel = panel_with_lines 2
    panel.panel_type.should eq 'title'
  end
end
