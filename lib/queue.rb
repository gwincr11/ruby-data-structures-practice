class Queue < LinkedList

  def enqueue(el)
    node = Node.new(el)
    if @first == nil
      @first = node
    end

    @last.next = node unless @last == nil
    @last = node
    @count += 1
  end

  def dequeue
    remove_node(@first)
  end


end