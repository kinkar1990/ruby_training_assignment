class ElectricityConsumption
    @@userDeatils = []
    def calculateCharges(inputUserName, inputUnitsConsumed)
        if(inputUnitsConsumed <= 100)
            @totalCharges = inputUnitsConsumed*6
        elsif(inputUnitsConsumed > 100 && inputUnitsConsumed <= 300)
            @remainingUnit = inputUnitsConsumed - 100
            @totalCharges = 100*6 + @remainingUnit*11
        else
            @remainingUnit = inputUnitsConsumed - 300 
            @totalCharges = 100*6 + 200*11 + @remainingUnit*15
        end
        if(@totalCharges > 300)
            @totalCharges = @totalCharges + (15*@totalCharges)/100
        else
            @totalCharges = @totalCharges + (5*@totalCharges)/100
        end
        if(@totalCharges < 50)
            @totalCharges = 50
        end
        @@userDeatils.push({"inputUserName" => inputUserName,
        "inputUnitsConsumed" => inputUnitsConsumed,
        "totalCharges" => @totalCharges.to_f.round(2)
    })
    end
    def displayUserUnitsConsumed
        i = 0
        @@userDeatils.each_with_index do |user, i|
            puts " #{i + 1} | #{user["inputUserName"]}  | #{user["inputUnitsConsumed"]}  |  #{user["totalCharges"]}"
        end
    end

end

electricityConsumption = ElectricityConsumption.new
puts "Enter the number of user"
inputUserCount = gets.chomp.to_i
if(inputUserCount > 0)
    i = 1
    while i <= inputUserCount
        puts "Enter the name of user"
        inputUserName = gets.chomp
        puts "Enter the units consumed by user"
        inputUnitsConsumed = gets.chomp.to_i
        electricityConsumption.calculateCharges(inputUserName, inputUnitsConsumed)
        i = i + 1
    end
    electricityConsumption.displayUserUnitsConsumed
else
    puts "Please enter correct input"
    exit
end


