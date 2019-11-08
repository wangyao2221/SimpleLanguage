$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Expression'
require 'Machine'
require 'Statement'

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

# machine = Machine.new(Assignment.new(:x,Add.new(Variable.new(:x),Number.new(1))),
#                       {x: Number.new(2)}
# )
#
# machine.run
#

# machine = Machine.new(
#     If.new(
#         LessThan.new(Number.new(1),Number.new(2)),
#         Assignment.new(:x, Number.new(1)),
#         Assignment.new(:x, Number.new(2))
#     ),
#     {x: Number.new(0)}
# )
#
# machine.run

# machine = Machine.new(
#        Sequence.new(
#             Assignment.new(:x, Number.new(10)),
#             Assignment.new(:y, Number.new(20))
#        ),
#        {}
# )
#
# machine.run

machine = Machine.new(
       While.new(
           LessThan.new(Variable.new(:x), Number.new(10)),
           Sequence.new(
                       Assignment.new(:x, Add.new(Variable.new(:x), Number.new(1))),
                       Assignment.new(:y, Add.new(Variable.new(:y), Number.new(1)))
           )
       ),
       {x: Number.new(0), y: Number.new(0)}
)

machine.run