puts "Enter The Range : "
endIndex = gets 
i = 1
endIndex = endIndex.to_i
puts "\n\nThe Ascii Art : \n\n"
while i <= endIndex
    j = 1
    if i%2 == 0
        k = i.to_s + "\t"
    else
        k = "*\t" 
    end
    while j <= i
        print k
        j = j + 1
    end
    print "\n"
    i = i + 1
end