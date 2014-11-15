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

  context "push function" do
    before do
      @list.push(@test1)
    end
    it { @list.first.val.should eq(@test1) }
    it { @list.last.val.should eq(@test1) }
    it { @list.count.should eq(1) }

    describe "last items changes as size grows" do
      before do
        @list.push(@test2)
      end
      it { @list.last.val.should eq(@test2) }
      it { @list.first.next.val.should eq(@test2) }
    end

    describe "the next node value changes" do
      before do
        @list.push(@test2)
        @list.push(@test3)
      end
      it { @list.first.next.val.should eq(@test2) }
      it { @list.first.next.next.val.should eq(@test3) }
      it { @list.last.val.should eq(@test3) }
    end
  end

  context "shift function" do
    before do
      @list.push(@test1)
      @list.push(@test2)
      @list.push(@test3)
    end
    describe "first item" do
      before do
        @removed = @list.shift
      end
      it { @removed.should eq(@test1)}
      it { @list.first.val.should eq(@test2)}
    end
  end
end