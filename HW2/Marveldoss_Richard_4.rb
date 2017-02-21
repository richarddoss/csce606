class Array
    def palindrome?                      #defining palindrome for class Array
        print self,"\n"
        print self.reverse
      if self==self.reverse              #checking if palindrome or not
           true
      else
           false
      end
  end
end
a=["A"=>1,"b"=>2]
print a.palindrome?