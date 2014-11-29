require 'spec_helper'
require "rspec"

describe LinkedList do
  before do
    @list = LinkedList.new
    @test1 = "test1"
    @test2 = "test2"
    @test3 = "test3"
  end
  subject { @list }

  it { @list.first.should eq(nil) }
  it { @list.last.should eq(nil) }
  it { @list.should_not eq(nil) }
  it { @list.count.should eq(0) }

  describe "#swap" do
    before do
      @list = Stack.new
      @list.push(@test1)
      @list.push(@test2)
      @list.push(@test3)

      @list.swap(@list.first, @list.first.next)
    end
    it { @list.first.val.should eq(@test2)}
    it { @list.first.next.val.should eq(@test1)}
  end

  describe "to array" do
     before do
      @list = Stack.new
      @list.push(@test1)
      @list.push(@test2)
      @list.push(@test3)

      @array_rep = @list.to_a
    end
    it { @array_rep.should =~ [@test1, @test2, @test3] }
  end

  describe "enumerable" do
    before do
      @list = Stack.new
      @list.push(@test1)
      @list.push(@test2)
      @list.push(@test3)
      @array_rep = @list.to_a
    end

    it "should iterate" do
      @list.each_with_index do | item, i |
        item.val.should eq(@array_rep[i])
      end
    end

  end

  describe "comparable" do
    before do
      @list = Stack.new
      @test1 = 1
      @test2 = 2
      @list.push(@test1)
      @list.push(@test2)
    end
    it { @list.first.should be < @list.last}
  end

end