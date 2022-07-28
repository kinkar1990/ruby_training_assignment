puts "Enter The Range : "
end_index = gets 
i = 1
end_index = end_index.to_i
puts "\n\nThe Ascii Art : \n\n"
while i <= end_index
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