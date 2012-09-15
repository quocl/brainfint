# Brainfuck interpreter in ruby

class Brainfuck
	SIZE = 30000
	def initialize
		@VALID_COMMANDS = ['>', '<', '+', '-', '.',',', '[', ']']
		@limit = Array.new(SIZE,0)
		@pos = 0
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

	def move_right
		@pos += 1 unless @pos >= SIZE - 1
	end

	def move_left
		@pos -= 1 unless @pos <= 0
	end 

	def increase
		@limit[@pos] += 1 
	end
	
	def decrease
		@limit[@pos] -= 1
	end



end

#Brainfuck.abc
a = Brainfuck.new
puts a.limit

