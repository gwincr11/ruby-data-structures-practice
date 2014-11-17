class LinkedList
  attr_reader :first, :last, :count

  def initialize
    @first = nil
    @last = nil
    @count = 0
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