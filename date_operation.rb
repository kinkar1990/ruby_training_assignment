require 'date'
class DateOperation
    def convert_date(input_date, input_type)
        input_date = Date.parse(input_date)
        puts "The Outputs is:"
        if input_type == 'IST'
            puts input_date.strftime("%d/%m/%Y")  
        elsif input_type == 'ORT'
            puts input_date.strftime("%Y-%m-%d %H:%M:%S %z")  
        else
            puts input_date.strftime("%m/%d/%Y")
        end   
    end
end

date_operation = DateOperation.new
puts 'Enter the date'
input_date = gets.chomp
puts 'Enter the type'
input_type = gets.chomp
date_operation.convert_date(input_date, input_type)