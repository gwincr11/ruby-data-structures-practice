require "merge_sortable"
require "bubble_sortable"

class LinkedList
  attr_reader :first, :last, :count
  include Enumerable
  include BubbleSortable
  include MergeSortable

  def initialize
    @first = nil
    @last = nil
    @count = 0
  end

  def remove_node(node)
    return nil unless node != nil
    if node == @first
      el = @first.val
      @first =@first.next
      if @first == nil
        @last = nil
      end
    end
    if node == @last
      el = @last.val
      @last = @first
      (1..@count-2).each do |n|
        @last = @last.next
      end
      @last.next = nil
    end
    @count -= 1
    return el
  end

  def swap(el1, el2)
    temp = el1.val
    el1.val = el2.val
    el2.val = temp
  end

  def to_a
    el = @first
    array_rep = [@first.val]
    while(el.next) do
      array_rep << el.next.val
      el = el.next
    end
    array_rep
  end

  def each &block
    el = @first
    (1..@count).each do
      if block_given?
        block.call el
      else
        yield el
      end
      el = el.next
    end
  end

  class Node
    attr_accessor :next, :prev, :val
    include Comparable

    def <=> other
      self.val <=> other.val
    end

    def initialize(val, next_node = nil, prev_node = nil)
      @next = next_node
      @prev = prev_node
      @val = val
    end
  end

end