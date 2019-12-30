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
    self
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
    res_arr = []
    my_each do |x|
      res_arr << x if yield x
    end
    res_arr
  end

  def my_all?(arg = nil)
<<<<<<< HEAD
    if block_given?
      my_each { |i| return false unless yield(i) }
    elsif arg.class == Class
      my_each { |i| return false unless i.class == arg }
    elsif arg.class == Regex
      my_each { |i| return false unless i =~ arg }
    elsif arg.nil?
      my_each { |i| return false unless i }
    else
      my_each { |i| return false unless i == arg }
=======
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
>>>>>>> feature
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |i| return true if yield(i) }
    elsif arg.class == Class
      my_each { |i| return true if i.class == arg }
    elsif arg.class == Regex
      my_each { |i| return true if i =~ arg }
    elsif arg.nil?
      my_each { |i| return true if i }
    else
      my_each { |i| return true if i == arg }
    end
    false
  end

  def my_none?
    if block_given?
      my_each { |i| return false if yield(i) }
    elsif arg.class == Class
      my_each { |i| return false if i.class == arg }
    elsif arg.class == Regex
      my_each { |i| return false if i =~ arg }
    elsif arg.nil?
      my_each { |i| return false if i }
    else
      my_each { |i| return false if i == arg }
    end
    true
  end

  def my_count(cnt = nil)
    counter = 0
    if block_given?
      my_each { |i| counter += 1 if yield(i) == true }
    elsif cnt.nil?
      my_each { counter += 1 }
    else
      my_each { |i| counter += 1 if i == cnt }
    end
    counter
  end

  def my_map(proc = nil)
    return self.to_enum unless block_given?
    this = self
    res_arr = []
    this.my_each do |i|
      res_arr << (block_given? ? yield(i) : proc.call(i))
    end
    res_arr
  end

  def my_inject(*args)
    array = to_a.dup
    if args[0].nil?
      memory = arr.shift
    elsif args[1].nil? && !block_given?
      sym = args[0]
      memory = arr.shift
    elsif args[1].nil? && block_given?
      memory = args[0]
    else
      memory = args[0]
      sym = args[1]
    end

    array[0..-1].my_each do |i|
      memory = if sym
               memory.send(sym, i)
              else
               yield(memory, i)
             end
    end
    memo
  end

end

def multiply_els(arr)
  arr.my_inject :*
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
