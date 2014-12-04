class Heap
  attr_reader :as_array

  def initialize(a)
      #(start is assigned the index in 'a' of the last parent node)
      #the last element in a 0-based array is at index count-1; find the parent of that element)
      #start ← floor ((count - 2) / 2)
      @as_array = a
      @length = @as_array.length
      start = ((@length -1) /2)
      #puts "Start #{@as_array}"

      start.downto(0) do |index|
        #puts "-"*10
        sift_down(index, @length - 1)
        #puts "#{@as_array}"
      end
  end

#Repair the heap whose root element is at index 'start', assuming the heaps rooted at its children are valid
  def sift_down(start, _end)
    root = start

    loop do    #(While the root has at least one child)
        child = root * 2 + 1       #(Left child)

        #puts "check root #{root} and child #{child}"
        break if child > _end

        #(If there is a right child and that child is greater)
        if child+1 <= _end and @as_array[child] < @as_array[child+1]
            child = child + 1
        end
        if @as_array[root] < @as_array[child]
            #puts "swap #{@as_array[child]} w\ #{@as_array[root]}"
            @as_array[root], @as_array[child] = @as_array[child], @as_array[root]
            root = child            #(repeat to continue sifting down the child now)
        else
          break
        end
    end
  end

  def max
    @as_array[0]
  end

  def heap_sort
    _last = @as_array.length - 1

    while _last >= 0
      @as_array << @as_array.shift
      _last -= 1
      sift_down(0, _last)
    end

    @as_array
  end


end