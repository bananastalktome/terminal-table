
require File.dirname(__FILE__) + '/spec_helper'

describe Terminal::Table do
  Cell = Terminal::Table::Cell
  
  it "should default alignment to the left" do
    cell = Cell.new 0, 'foo'
    cell.value.should == 'foo'
    cell.alignment.should == :left
  end

  it "should allow overriding of alignment" do
    cell = Cell.new 0, :value => 'foo', :alignment => :center
    cell.value.should == 'foo'
    cell.alignment.should == :center
  end
  
  it "should allow text color" do
    cell = Cell.new 0, :value => 'foo', :text_color => :green
    cell.value.should == 'foo'
    cell.text_color.should == :green
  end

  it "should allow text style" do
    cell = Cell.new 0, :value => 'foo', :text_style => :bold
    cell.value.should == 'foo'
    cell.text_style.should == :bold
  end
    
  it "should allow background color" do
    cell = Cell.new 0, :value => 'foo', :background_color => :green
    cell.value.should == 'foo'
    cell.background_color.should == :green
  end
  
  it "should allow all styles applied" do
    cell = Cell.new 0, :value => 'foo', :text_color => :red, :text_style => :bold, :background_color => :green
    cell.value.should == 'foo'
    cell.text_color.should == :red
    cell.text_style.should == :bold
    cell.background_color.should == :green
  end
end
