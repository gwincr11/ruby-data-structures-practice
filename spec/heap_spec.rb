require 'spec_helper'
require "rspec"

describe Heap do

  describe "heap order" do
    before do
      @heap = Heap.new([10, 20 , 1, 3, 5, 2])
    end
    it " is sorted so that a parents children are smaller then the parents" do
      @heap.max.should eq(20)
    end
  end

  describe "heap sort" do
    before do
      @array = [10, 20 , 1, 3, 5, 2]
      @heap = Heap.new(@array)
    end
    it " is sorted" do
      @heap.heap_sort.should eq(@array.sort.reverse)
    end
  end

end