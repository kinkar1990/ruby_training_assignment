puts 'Hello world'
class HelloWorld
    def initialize(name)
       @name = name.capitalize
    end
    def sayHi
       puts "Hello #{@name}!"
    end
 end
 # To check single line comment
=begin
	this is a multiline comment
	nothing in here will be part of the code
=end

 hello = HelloWorld.new("World")
 hello.sayHi