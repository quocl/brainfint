RUBY=ruby
SRC=./src
EX=./examples

hello1:
	$(RUBY)	$(SRC)/brainfuck.rb	<	$(EX)/hello_world.bf

hello2:
	$(RUBY)	$(SRC)/brainfuck.rb	<	$(EX)/hello_world2.bf

fib:
	$(RUBY)	$(SRC)/brainfuck.rb	<	$(EX)/fibonacci.bf

fib_small:
	$(RUBY)	$(SRC)/brainfuck.rb	<	$(EX)/fibonacci_under_hundred.bf

fact:
	$(RUBY)	$(SRC)/brainfuck.rb	<	$(EX)/factorial.bf

