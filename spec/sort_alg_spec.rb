require 'spec_helper'
require "rspec"

describe "Linked list sorts" do
  before do
    @list = Stack.new
    @array = [3,1,5,10, 2, 7, 1]
    @array.each do |n|
      @list.push(n)
    end
  end

  subject { @list }

  describe "Bubble sort should put the elements in order" do
    before do
      @sorted = @array.sort
      @list.bubble_sort
    end
    it { @list.to_a.should == @sorted }


  end



  describe "merge sort should put the elements in order" do
    before do
      @sorted = @array.sort
      @list.merge_sort
    end
    it { @list.merge_sort.to_a.should == @sorted }

  end
end