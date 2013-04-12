
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{

      def #{attr_name}=(val)
        @#{attr_name + "_history"} ||= [nil]
        @#{attr_name + "_history"}.push(val)
        @#{attr_name} = val
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history.inspect # => if your code works, should be [nil,1,2]

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def in(another_id)
    another_currency = another_id.to_s.gsub(/s$/,'')
    if @@currencies.has_key?(another_currency)
      self / @@currencies[another_currency]
    else
      super
    end
  end
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

puts 12.dollars.in(:yen)
puts 10.rupees.in(:euro)

class String
  def palindrome?
    self.gsub(/[^a-zA-Z]/,'').downcase.reverse == self.gsub(/[^a-zA-Z]/,'').downcase
  end
end

module Enumerable
  def palindrome?
    self.join.gsub!(/(\W|\b)+/i, "") == self.join.reverse
    #self.reverse == self 
  end
end

puts "fool".palindrome?.inspect
puts "lool".palindrome?.inspect
puts [1,2,3,3,2,1].palindrome?.inspect
