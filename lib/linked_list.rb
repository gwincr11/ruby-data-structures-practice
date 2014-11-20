class LinkedList
  attr_reader :first, :last, :count

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
      (1..@count-1).each do |n|
        @last = @first.next
      end
    end
    @count -= 1
    return el
  end

  class Node
    attr_accessor :next, :prev
    attr_reader :val

    def initialize(val, next_node = nil, prev_node = nil)
      @next = next_node
      @prev = prev_node
      @val = val
    end

  end

end