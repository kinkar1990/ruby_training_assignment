class Student
    attr_accessor :rollnum, :studname, :marks
    def initialize(rollnum, studname, *marks)
       @rollnum = rollnum
       @studname = studname
       @marks = marks
    end
    def calculatetotal
        @totalmarks = 0
        for i in @marks do
            @totalmarks = @totalmarks + i
        end
    end    
    def displaystuddetails
        puts("rollnum = #{@rollnum} studname = #{@studname} totalmarks = #{@totalmarks}")
    end
end

class StudentDemo < Student
end
student = StudentDemo.new(10, 'Kinkar', 55, 55 , 80)
student.calculatetotal
student.displaystuddetails
student.marks = 55, 55 , 80, 100
student.calculatetotal
student.displaystuddetails