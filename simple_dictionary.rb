class SimpleDictionary
    @@hash = {}
    def add(number)
        if @@hash.keys.last == nil
            @@hash.store(0, number) 
        else
            @@hash.store(@@hash.keys.last + 1, number) 
        end
    end
    def update(position, input_number_update)
        if @@hash.key?position
            @@hash[position] = input_number_update
        else
            puts "Postion - #{position} doesn't exist"
        end
    end
    def delete(position)
        if @@hash.key?position
            @@hash.delete(position)
        else
            puts "Postion - #{position} doesn't exist"
        end
    end
    def search(number)
        if @@hash.has_value?number
            puts "Output :"
            puts "#{number} exists"
        else
            puts "Output :"
            puts "#{number} doesn't exist" 
        end
    end
    def show
        puts "The Output is :"
        @@hash.each do |key, value|
            puts key.to_s + ' => ' + value.to_s
        end
    end
end

simple_dictionary = SimpleDictionary.new
loop do 
    puts "Please enter 1 => Add 2 => Update 3 => Delete 4 => Search"
    input_method = gets.chomp.to_i
    case input_method
    when 1
        puts "Enter the number to add"
        input_add = gets.chomp
        simple_dictionary.add(input_add)
        simple_dictionary.show
    when 2
        puts "Enter the position to update"
        input_position_update = gets.chomp
        puts "Enter the number to update"
        input_number_update = gets.chomp
        simple_dictionary.update(input_position_update.to_i, input_number_update)
        simple_dictionary.show
    when 3
        puts "Enter the position to delete"
        input_position_delete = gets.chomp
        simple_dictionary.delete(input_position_delete.to_i)
        simple_dictionary.show
    when 4
        puts "Enter the number to search"
        input_number_search = gets.chomp
        simple_dictionary.search(input_number_search)
    else
        puts "Wrong Input. Please enter correct"
        break
    end
    puts "Would you like to continue then press Y"
    input_continue = gets.chomp
    if input_continue != "Y" && input_continue != "y"
        break
    end
end


