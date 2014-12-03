 module MergeSortable
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
end