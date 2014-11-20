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
    it { @list.first.val.should eq(@sorted[0]) }
    it { @list.first.next.val.should eq(@sorted[1]) }
    it { @list.first.next.next.val.should eq(@sorted[2]) }
    it { @list.first.next.next.next.val.should eq(@sorted[3]) }

  end

  describe "merge sort should put the elements in order" do
    before do
      @sorted = @array.sort
      @list.merge_sort
    end
    it { @list.first.val.should eq(@sorted[0]) }
    it { @list.first.next.val.should eq(@sorted[1]) }
    it { @list.first.next.next.val.should eq(@sorted[2]) }
    it { @list.first.next.next.next.val.should eq(@sorted[3]) }

  end
end