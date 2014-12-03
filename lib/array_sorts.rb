module ArraySorts

  def self.get_digit(num, place)
    num.to_s[place].to_i
  end

  def self.make_blanks
    blanks = []
    for i in (0..9)
      blanks << []
    end
    blanks
  end

  def self.split(array, place)
    buckets = make_blanks()
    for num in array
      buckets[get_digit(num, place)] << num
    end
    buckets
  end

  def self.radix_sort(array)
      passes = array.max.to_s.length
      sorted = array
      for i in (1..passes)
        index = -i.to_i
        sorted = split(sorted, index).flatten
      end
      sorted
  end

end