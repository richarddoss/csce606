def count_words(phrase)
h=Hash.new(0)
phrase.gsub!(/[^0-9A-Za-z ]/, '') #removing all chars except alphapets
phrase.downcase!
p=phrase.scan(/\b[a-z]+\b/)   #converting a string of words into array of words
p.each do |i|
h[i]=h[i]+1                     #forming the hash table
end
print h
end

count_words("Doo bee doo bee doo")