def combine_anagrams(words)
    
    i=0;
    output=[]
    while words.length!=0 do
        i=0;
        j=1;
        ele=[words[0]]                             #first word in every iteration is added to a new array
        while j<words.length do
             sot1=words[0].downcase.chars.sort.join         #sorting to find if anagrams. First word is the reference
             sot2=words[j].downcase.chars.sort.join         #sorting other elemnts to see if anagrams are present
             #print sot1,"\n"
             #print sot2,"\n"
             if sot2==sot1
                 ele.push(words[j])                 #if present pushed into new array
                 words.delete(words[j])             #word is removed from the array 
             end
             
             j=j+1;
             
        end
        words.delete(words[0])                      #the reference word is also removed
        output.push(ele)                            #the array of anagrams is added to the array output
    end
    return(output)
end

input=['Cars', 'for', 'potatoes', 'RACS', 'foUR','scar', 'creams', 'scream']
print combine_anagrams(input)

        