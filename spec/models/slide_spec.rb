require 'spec_helper'

describe Slide do
  
  it "should build a panel if it has none" do
    subject.panels.size.should eq 1
  end

  it "should not be valid with 0 panels" do
    slide = Slide.new
    slide.panels = []
    slide.should_not be_valid
  end

  it "should not be valid with more than 3 panels" do
    slide = Slide.new()
    slide.panels.build(text: 'Valid')
    slide.panels.build(text: 'Valid')
    slide.panels.build(text: 'Valid')
    slide.should_not be_valid
  end

  it "should not be valid with 2 panels" do
    slide = Slide.new()
    slide.panels = [Panel.new, Panel.new]
    slide.should_not be_valid
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
end
