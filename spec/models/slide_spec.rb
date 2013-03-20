require 'spec_helper'

describe Slide do
  
  it "should be valid with 0 panels" do
    slide = Slide.new
    slide.panels = []
    slide.should be_valid
  end

  it "should be valid with more than 3 panels" do
    slide = Slide.new()
    slide.panels.build(text: 'Valid')
    slide.panels.build(text: 'Valid')
    slide.panels.build(text: 'Valid')
    slide.panels.build(text: 'Valid')
    slide.should be_valid
  end

  it "should be valid with 2 panels" do
    slide = Slide.new()
    slide.panels = [Panel.new, Panel.new]
    slide.should be_valid
  end

  it "should respond to panel_count" do
    slide = Slide.new()
    slide.panels = [Panel.new, Panel.new]
    slide.save
    slide.panel_count.should eq 2
  end
  
  it "should be valid with 1 panel" do
    slide = Slide.new()
    slide.panels = [Panel.new]
    slide.should be_valid
  end

  it "should be valid with 3 panels" do
    slide = Slide.new()
    slide.panels = [Panel.new, Panel.new, Panel.new]
    slide.should be_valid
  end

  it "is slide type of 'one' if panel count is 1 " do
    slide = Slide.new()
    slide.panels = [Panel.new]
    slide.slide_type.should eq 'one'
  end

  it "is slide type of 'three' if panel count is 1 " do
    slide = Slide.new()
    slide.panels = [Panel.new, Panel.new, Panel.new]
    slide.slide_type.should eq 'three'
  end

  it "offers default color to panels through #background_color" do
    slide = Slide.new
    slide.background_color.should eq "#ffffff"
  end

  it "offers real color to panels through #background_color" do
    slide = Slide.new color: "#ff000e"    
    slide.background_color.should eq "#ff000e"
  end
end
