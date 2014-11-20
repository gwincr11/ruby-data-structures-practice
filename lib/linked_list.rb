class LinkedList
  attr_reader :first, :last, :count
  include Enumerable

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

  def bubble_sort
    iteration_count = @count
    el = @first
    sort_executed = true
    while(sort_executed) do
      sort_executed = false
      if el.val > el.next.val
        swap(el, el.next)
        sort_executed = true
      end
    end
  end


  class Node
    attr_accessor :next, :prev, :val

    def initialize(val, next_node = nil, prev_node = nil)
      @next = next_node
      @prev = prev_node
      @val = val
    end

  end

end