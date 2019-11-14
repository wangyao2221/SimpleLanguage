$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Expression'
require 'Statement'

# puts Number.new(10).evaluate({})
# puts Add.new(Number.new(10), Number.new(20)).evaluate({})
# puts GreaterThan.new(Add.new(Number.new(3), Number.new(2)), Add.new(Number.new(2), Number.new(2))).evaluate({})
#
# puts Assign.new(:x, Number.new(1)).evaluate({})
# puts If.new(GreaterThan.new(Number.new(1), Number.new(2)), Assign.new(:x, Number.new(1)), Assign.new(:x, Number.new(2))).evaluate({})
# puts Sequence.new(Assign.new(:x, Number.new(1)), Assign.new(:y, Number.new(2))).evaluate({})
puts While.new(LessThan.new(Variable.new(:x), Number.new(10)), Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))).evaluate({:x => Number.new(1)})