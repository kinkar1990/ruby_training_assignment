class SimpleDictionary
    @@hash = {}
    def add(number)
        if @@hash.keys.last == nil
            @@hash.store(0, number) 
        else
            @@hash.store(@@hash.keys.last + 1, number) 
        end
    end
    def update(position, inputNumberUpdate)
        if @@hash.key?position
            @@hash[position] = inputNumberUpdate
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
            puts "#{number} exists"
        else
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

simpleDictionary = SimpleDictionary.new
loop do 
    puts "Please enter 1 => Add 2 => Update 3 => Delete 4 => Search"
    inputMethod = gets.chomp.to_i
    case inputMethod
    when 1
        puts "Enter the number to add"
        inputAdd = gets.chomp
        simpleDictionary.add(inputAdd)
        simpleDictionary.show
    when 2
        puts "Enter the position to update"
        inputPositionUpdate = gets.chomp
        puts "Enter the number to update"
        inputNumberUpdate = gets.chomp
        simpleDictionary.update(inputPositionUpdate.to_i, inputNumberUpdate)
        simpleDictionary.show
    when 3
        puts "Enter the position to delete"
        inputPositionDelete = gets.chomp
        simpleDictionary.delete(inputPositionDelete.to_i)
        simpleDictionary.show
    when 4
        puts "Enter the number to search"
        inputNumberSearch = gets.chomp
        simpleDictionary.search(inputNumberSearch)
    else
        puts "Wrong Input. Please enter correct"
        break
    end
    puts "Would you like to continue press Y / N"
    inputContinue = gets.chomp
    if inputContinue != "Y" && inputContinue != "y"
        break
    end
end


