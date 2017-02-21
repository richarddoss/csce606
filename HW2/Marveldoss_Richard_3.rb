class String
    def palindrome?
    name=self    
    name.gsub!(/(\W|\d)/,"")  #extracting only alphabets
    name.downcase!
    rev=name.reverse          #getting the reversed phrase
    #print name,"\n"
    #print rev,"\n"
      if name==rev              #checking if palindrome or not
           true
      else
           false
      end
    end
end
print "racecar".palindrome?