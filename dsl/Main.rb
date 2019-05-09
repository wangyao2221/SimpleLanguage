$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Expression'
require 'Machine'

# machine = Machine.new(Add.new(
#     Multiply.new(Number.new(3),Multiply.new(Number.new(2),Number.new(2))),
#     Multiply.new(Number.new(3),Number.new(4))
# ))
#
# machine.run

# machine = Machine.new(LessThan.new(Multiply.new(Number.new(3), Multiply.new(Number.new(2), Number.new(2))),
#                                    Multiply.new(Number.new(3), Number.new(4))))
#
# machine.run

# machine = Machine.new(Multiply.new(Variable.new(:x), Variable.new(:y)),
#                       {x: Number.new(3), y: Number.new(4)})

machine = Machine.new(Assignment.new(:x,Add.new(Variable.new(:x),Number.new(1))),
                      {x: Number.new(2)}
)

machine.run