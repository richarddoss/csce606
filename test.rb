def palindrome?(name)
    name.gsub!(/(\W|\d)/,"")
    name.downcase!
    rev=name.reverse
    print name,"\n"
    print rev,"\n"
    if name==rev  
        return 0
    else
        return 1
    end
end
puts "What is you name?"
name=gets.chomp
x=palindrome?(name)
print x
if x==0
    print"Its a palindrome"
    
else
    print " Not a palindrome"
end
