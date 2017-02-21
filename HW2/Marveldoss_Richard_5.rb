class CartesianProduct
    include Enumerable
    #@c
    def initialize(array1,array2)
        @c=[]
        if array1.any? and array2.any?
          array1.each do |i|
              array2.each do |j|
                  @c.push([i,j])
              end
          end
          #print c
        else
          print "Array is empty to compute\n"
        end
    end
    def put
        @c.each do |ele|
          puts ele.inspect 
        end
    end
        
end
c = CartesianProduct.new([:a,:b,:C], [4,5])
c.put()