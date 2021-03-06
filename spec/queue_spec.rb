require 'spec_helper'
require "rspec"

describe Queue do
  before do
    @list = Queue.new
    @test1 = "test1"
    @test2 = "test2"
    @test3 = "test3"
  end
  subject { @list }

  it { @list.first.should eq(nil) }
  it { @list.last.should eq(nil) }
  it { @list.should_not eq(nil) }
  it { @list.count.should eq(0) }

describe "Add item #enqueue" do
    before do
      @list.enqueue(@test1)
    end
    it { @list.first.val.should eq(@test1) }
    it { @list.last.val.should eq(@test1) }
    it { @list.count.should eq(1) }

    describe "last items changes as size grows" do
      before do
        @list.enqueue(@test2)
      end
      it { @list.last.val.should eq(@test2) }
      it { @list.first.next.val.should eq(@test2) }
      it { @list.first.val.should eq(@test1) }
    end

    describe "the next node value changes" do
      before do
        @list.enqueue(@test2)
        @list.enqueue(@test3)
      end
      it { @list.first.next.val.should eq(@test2) }
      it { @list.first.next.next.val.should eq(@test3) }
      it { @list.first.val.should eq(@test1) }
    end
end

describe "Remove item #dequeue" do
  before do
      @list.enqueue(@test1)
      @list.enqueue(@test2)
      @list.enqueue(@test3)
  end

  describe "deque removes the first item" do
    before do
      @el = @list.dequeue
    end
    it { @el.should eq(@test1) }
    it {@list.first.val.should eq(@test2) }
  end

  describe "All items dequed" do
    before do
      @el1 = @list.dequeue
      @el2 = @list.dequeue
      @el3 = @list.dequeue
    end

    it { @el3.should eq(@test3) }
    it { @el2.should eq(@test2) }
    it { @el1.should eq(@test1) }

    it { @list.count.should eq(0) }
    it { @list.dequeue.should eq(nil) }
    it { @list.first.should eq(nil) }
    it { @list.last.should eq(nil) }
  end

end


end