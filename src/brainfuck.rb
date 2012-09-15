# Brainfuck interpreter in ruby

class Brainfuck
	def initialize
		@VALID_COMMANDS = ['>', '<', '+', '-', '.',',', '[', ']']
		@limit = [0]*30000
	end
	def self.abc
		puts 'hello'
	end

	def limit
		@limit
	end
	
	def limit=(val)
		@limit=val
	end

end

#Brainfuck.abc
a = Brainfuck.new
puts a.limit
a.limit = 4
puts a.limit
