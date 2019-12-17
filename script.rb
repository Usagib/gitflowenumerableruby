# frozen_string_literal: true

# enumerable ruby module
module Enumerable
  def my_each
    return self.to_enum unless block_given?
    i = 0
    length.times do
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    return self.to_enum unless block_given?
    i = 0
    length.times do
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    return self.to_enum unless block_given?
    i = 0
    res_arr = []
    length.times do
      res_arr << self[i] if yield(self[i]) == true
      i += 1
    end
    res_arr
  end

  def my_all?(arg = nil)
    i = 0
    length.times do
      if arg == nil && block_given? == false
        return false if self[i] == false
      else
        if block_given?
          (return false if yield(self[i]) == false) if arg == nil
          (return false unless yield(self[i]) is_a? arg) if arg != nil
        else

        end
        if block_given? && arg != nil
          return false if yield(self[i]) == false
        end
    end

      i += 1
    end
    true
  end

  def my_none?
    i = 0
    length.times do
      return false if yield(self[i]) == true

      i += 1
    end
    true
  end

  def my_count
    i = 0
    c = 0
    length.times do
      c += 1 if yield(self[i]) == true
      i += 1
    end
    c
  end

  def my_map
    i = 0
    res_array = []
    length.times do
      res_array << yield(self[i]) if block_given?
      res_array << proc.call(self[i])
      i += 1
    end
    res_array
  end

  def my_inject(start_value)
    my_each { |element| start_value = yield(start_value, element) }
    start_value
  end
end
def multiply_els(arr)
  arr.my_inject(1) { |initial, num| initial * num }
end
testa = [3, 6, 4, 1, 9, 7, 8, 2, 3]
testb = [2, 4, 6, 8, 10]
testc = [2, 3, 4, 8, 1, 3]
testd = [2, 4, 5]
my_proc = proc { |i| i * 2 }
a = testb.my_map { |i| i * 2 }
b = testc.my_each { |i| i * 2 }
c = testd.my_each
d = testd.my_each_with_index
e = testd.each_with_index
print c
print d
print e
