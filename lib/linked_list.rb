class LinkedList
  attr_reader :first, :last, :count

  def initialize
    @first = nil
    @last = nil
    @count = 0
  end

  def push(el)
    node = Node.new(el)
    if @first == nil
      @first = node
    end

    @last.next = node unless @last == nil
    @last = node
    @count += 1
  end

  def pop
    pop_el = @first
    @first = pop_el.next
    pop_el
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