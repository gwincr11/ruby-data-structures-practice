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

  def to_a
    el = @first
    array_rep = [@first.val]
    self.each do |el|
      array_rep << el.next.val
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

  def bubble_sort
    iteration_count = @count
    sort_executed = true
    while(sort_executed) do
      sort_executed = false
      el = @first
      (1..iteration_count ).each do
        if el.val && el.next && el.val > el.next.val
          swap(el, el.next)
          sort_executed = true
        end
        el = el.next
      end
      iteration_count = @count - 1
    end
  end

  def merge(left,right)
    result = []
    while left.length > 0 or right.length > 0
        if left.length > 0 and right.length > 0
            if left[0] <= right[0]
                result << left.shift
            else
                result << right.shift
            end
        elsif left.length > 0
            result << left.shift
        elsif right.length > 0
            result << right.shift
        end
    end
    return result
  end

  def merge_sort_split(array)
    if array.length <= 1
        return array
    end

    if array.length == 2
      middle = 0
    else
      middle = (array.length / 2).floor
    end
    left = array[0..middle]
    right = array[middle+1..-1]

    left = merge_sort_split(left)
    right = merge_sort_split(right)

    result = merge(left, right)

    return result
  end

  def merge_sort
    array_rep = to_a
    result = merge_sort_split(array_rep)
    el = @first
    result.each do |val|
      el.val = val
      el = el.next
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