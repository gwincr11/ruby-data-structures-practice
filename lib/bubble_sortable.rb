 module BubbleSortable
  def bubble_sort
    iteration_count = @count
    sort_executed = true
    while(sort_executed) do
      sort_executed = false
      el = @first
      self.each do
        if el.val && el.next && el > el.next
          swap(el, el.next)
          sort_executed = true
        end
        el = el.next
      end
      iteration_count = @count - 1
    end
  end
end