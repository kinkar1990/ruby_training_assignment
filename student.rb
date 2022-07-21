class Student
    def setStudDetails(rollNum, studName, mark1, mark2, mark3)
        @rollNum = rollNum
        @studName = studName
        @mark1 = mark1
        @mark2 = mark2
        @mark3 = mark3
    end
    def calculateTotal
        @totalMarks = @mark1 + @mark2 + @mark3
    end    
    def displayStudDetails
        puts("rollNum = #{@rollNum} studName = #{@studName} totalMarks = #{@totalMarks}")
    end
end

class StudentDemo < Student
end
student = StudentDemo.new
student.setStudDetails(1234, "Test", 54, 55, 56)
student.calculateTotal
student.displayStudDetails