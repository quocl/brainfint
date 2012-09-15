# Brainfuck interpreter in ruby
# There are 8 valid commands in brainfuck, which are: '>', '<', '+', '-', '.',',', '[' and  ']'


class Brainfuck
	SIZE = 30000
	VALID_COMMAND = ['>', '<', '+', '-', '.',',', '[', ']']
	def initialize(input="")
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
	
	def write
		print @limit[@pos].chr
	end

	def read
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

	def eval
		@input.each do |comand|
			case command
			when '>'
				move_right
			when '<'
				move_left
			when '+'
				increase
			when '-'
				decrease
			when '.'
				write
			when ','
				read
			when '['
				jump_forward
			when ']'
				jump_backward
			else
				puts "Invalid input: Unrecognized character #{command}"
			end
		end
	end
end

a = Brainfuck.new("+++these+++ are++++[>+++comments++++>+++in+++a++++>+++brainfuck>+<<<<-]program!!!>++.>+.++++lol+++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.")

