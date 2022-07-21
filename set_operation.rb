class SetOperation
    def initialize(input1, input2)
        @input1 = input1
        @input2 = input2
    end
    def union
        puts "Union Output :"
        print @input1 | @input2 
        puts ""
    end
    def intersection
        puts "Intersection Output :"
        print @input1 & @input2
        puts ""
    end
    def complement
        puts "Complement Output :"
        print @input1 - @input2
        puts ""
    end
    def cartesian
        puts "Cartesian Product Output :"
        i = 0
        while i < @input1.length()
            j = 0
            while j < @input2.length()
                if(i == 0 && j == 0)
                    print "{{ #{@input1[i]} , #{@input2[j] } } ,"
                elsif(i == @input1.length()-1 && j == @input2.length()-1)
                    print "{ #{@input1[i]} , #{@input2[j] } } }"
                else
                    print "{ #{@input1[i]} , #{@input2[j] } } ,"
                end
                j = j + 1
            end
            print "\n"
            i = i + 1
        end
    end
end

setOperation = SetOperation.new([1,2,3,4,5,6],[1,2,3,4])
setOperation.union
setOperation.intersection
setOperation.complement
setOperation.cartesian