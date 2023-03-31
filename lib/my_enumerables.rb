module Enumerable
  def my_each_with_index(&block)
    i = 0
    while i < size
      block.call(self[i], i)
      i += 1
    end
    self
  end

  def my_select(&block)
    new_array = []
    my_each do |elem|
      if block.call(elem)
        new_array << elem
      end
    end
    new_array
  end

  def my_all?(&block)
    result = true
    my_each { |elem| result = false unless block.call(elem) }
    result
  end

  def my_any?(&block)
    result = false
    my_each { |elem| result = true if block.call(elem) }
    result
  end

  def my_none?(&block)
    result = true
    my_each { |elem| result = false if block.call(elem) }
    result
  end

  def my_count(&block)
    count = 0
    if block_given?
      my_each { |elem| count += 1 if block.call(elem)}
    else
      my_each { count += 1 }
    end
    count
  end

  def my_map(&block)
    new_array = []
    if block_given?
      my_each { |elem| new_array << block.call(elem) }
    end
    new_array
  end

  def my_inject(initial=0, &block)
    initial_value = initial
    if block_given?
      my_each { |elem| initial_value = block.call(elem, initial_value) }
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined i
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    i = 0
    while i < size
      block.call(self[i])
      i += 1
    end
    self
  end
end
