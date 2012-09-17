# Brainfuck interpreter in ruby 1.9.3
# There are 8 valid commands in brainfuck, which are: '>', '<', '+', '-', '.',',', '[' and  ']'

class Brainfuck
	SIZE = 30000
	def initialize(input="")
		# initialize the brainfuck interpreter
		@data = Array.new(SIZE,0)   # data
		@pos = 0		    # data pointer 
		@program = input.gsub(/[^\>\<\.\,\+\-\[\]]/m, '').split('') # the brainfuck program
		@program_pos = 0   # brainfuck program pointer
		@depth = 0 #depth of the loop 
	end

	def move_right
		# function for '>'
		# increment the data pointer (to point to the next cell to the right).
		@pos += 1 unless @pos >= SIZE - 1
	end

	def move_left
		# function for '<'
		# decrement the data pointer (to point to the next cell to the left).
		@pos -= 1 unless @pos <= 0
	end 

	def increase
		# function for '+'
		# increment (increase by one) the byte at the data pointer.
		@data[@pos] += 1 
	end
	
	def decrease
		# function for '-'
		# decrement (decrease by one) the byte at the data pointer.
		@data[@pos] -= 1
	end
	
	def write
		# function for '.'
		# output the byte at the data pointer as an ASCII encoded character.
		print @data[@pos].chr
	end

	def read
		# function for ','
		# accept one byte of input, storing its value in the byte at the data pointer.
		tmp = gets 
		@data[@pos] = tmp[0].ord
	end

	def jump_forward
		# function for '['
		@depth += 1
		current_depth = @depth
		if @data[@pos] == 0
			while true
				@program_pos += 1 
		    if @program[@program_pos] == '['
					@depth += 1
				elsif @program[@program_pos] == ']'
					@depth -= 1
					if @depth == current_depth - 1
		      	break
		      end
				end
			end
		else
			@program_pos += 1 
		end		
	end

	def jump_backward
		# function for ']'
		@depth -= 1
		current_depth = @depth
		if @data[@pos] != 0
			while true 
				@program_pos -= 1
				if @program[@program_pos] == ']'
					@depth += 1
				elsif @program[@program_pos] == '['
					@depth -= 1
					if @depth == current_depth - 1
						break
					end
				end
			end
		else
			@program_pos += 1 
		end	
	end

	def eval
		# evaluate the brainfuck program
		while @program_pos < @program.size
			case @program[@program_pos]
			when '>'
				move_right
				@program_pos += 1
			when '<'
				move_left
				@program_pos += 1
			when '+'
				increase
				@program_pos += 1
			when '-'
				decrease
				@program_pos += 1
			when '.'
				write
				@program_pos += 1
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

interpreted_program = Brainfuck.new(STDIN.read)
interpreted_program.eval
