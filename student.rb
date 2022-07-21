class Student
    def setStudDetails(rollNum, studName, *args)
        @rollNum = rollNum
        @studName = studName
        @marks = args 
    end
    def calculateTotal
        @totalMarks = 0
        for i in @marks do
            @totalMarks = @totalMarks + i
        end
    end    
    def displayStudDetails
        puts("rollNum = #{@rollNum} studName = #{@studName} totalMarks = #{@totalMarks}")
    end
end

class StudentDemo < Student
end
student = StudentDemo.new
student.setStudDetails(1234, "Test", 54, 55, 56, 40)
student.calculateTotal
student.displayStudDetails