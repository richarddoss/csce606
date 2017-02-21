def palindrome?(name)
    name.gsub!(/(\W|\d)/,"")  #extracting only alphabets
    name.downcase!
    rev=name.reverse          #getting the reversed phrase
    #print name,"\n"
    #print rev,"\n"
    if name==rev              #checking if palindrome or not
        print true
    else
        print false
    end
end
palindrome?("A man, a plan, a canal-- Panama")