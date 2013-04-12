class CartesianProduct
  include Enumerable
  def initialize(a,b)
    @array_1 = a
    @array_2 = b
  end
  def each 
    @array_1.each do |each_1|
      @array_2.each do |each_2|
        yield [each_1, each_2]
      end
    end
  end
end
#Examples of use
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
