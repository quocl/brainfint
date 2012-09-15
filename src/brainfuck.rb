# Brainfuck interpreter in ruby
# There are 8 valid commands in brainfuck, which are: '>', '<', '+', '-', '.',',', '[' and  ']'


class Brainfuck
	SIZE = 30000
	VALID_COMMAND = ['>', '<', '+', '-', '.',',', '[', ']']
	def initializie(input=[])
		@limit = Array.new(SIZE,0)
		@pos = 0
		@input = input.split('')
		@input_pos = 0
	end

	def self.abc
		print VALID_COMMAND
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
	
	def out
		print @limit[@pos].chr
	end

	def in
		@limit[@pos] = STDIN.getc || 0
	end

	def jump_forward
		if @limit[@pos] == 0
			@input_pos += 1 while @input[@input_pos] != ']'
		end		
	end

	def jump_backward
		if @limit[@pos] != 0
			@input_pos -= 1 while @input[@input_pos] != '['
		end	
	end
end

#Brainfuck.abc
a = Brainfuck.new
#puts a.limit
puts Brainfuck.abc
puts STDIN
