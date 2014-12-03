require 'spec_helper'
require "rspec"

describe "Array sorts" do

  describe "radix sort" do
    before {
      @my_array = [123, 37, 1, 5, 200, 55]
    }
    it { ArraySorts::radix_sort(@my_array).should eq(@my_array.sort )}
  end
end