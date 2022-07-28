class ElectricityConsumption
    attr_accessor :input_user_name, :input_units_consumed
    @@user_deatils = []
    def initialize(input_user_name, input_units_consumed)
        @input_user_name = input_user_name
        @input_units_consumed = input_units_consumed
    end
    def calculate_charges
        case @input_units_consumed
        when 1..99
            @total_charges = @input_units_consumed*6
        when 100..300
            @remainingUnit = @input_units_consumed - 100
            @total_charges = 100*6 + @remainingUnit*11
        else
            @remainingUnit = @input_units_consumed - 300 
            @total_charges = 100*6 + 200*11 + @remainingUnit*15
        end
        case @total_charges
        when 1..300
            @total_charges = @total_charges + (5*@total_charges)/100
        else
            @total_charges = @total_charges + (15*@total_charges)/100
        end
        @@user_deatils.push({"input_user_name" => input_user_name,
        "input_units_consumed" => @input_units_consumed,
        "total_charges" => @total_charges < 50 ? 50.00 : @total_charges.to_f.round(2)
    })
    end
    def display_user_units_consumed
        i = 0
        @@user_deatils.each_with_index do |user, i|
            puts " #{i + 1} | #{user["input_user_name"]}  | #{user["input_units_consumed"]}  |  #{user["total_charges"]}"
        end
    end

end

puts "Enter the number of user"
input_user_count = gets.chomp.to_i
if(input_user_count > 0)
    i = 1
    while i <= input_user_count
        puts "Enter the name of user"
        input_user_name = gets.chomp
        puts "Enter the units consumed by user"
        input_units_consumed = gets.chomp.to_i
        electricity_consumption = ElectricityConsumption.new(input_user_name, input_units_consumed)
        electricity_consumption.calculate_charges
        i = i + 1
    end
    electricity_consumption.display_user_units_consumed
else
    puts "Please enter correct input"
    exit
end


