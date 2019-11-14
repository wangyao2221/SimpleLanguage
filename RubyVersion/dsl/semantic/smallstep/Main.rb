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

# machine = Machine.new(Assign.new(:x,Add.new(Variable.new(:x),Number.new(1))),
#                       {x: Number.new(2)}
# )
#
# machine.run
#

# machine = Machine.new(
#     If.new(
#         LessThan.new(Number.new(1),Number.new(2)),
#         Assign.new(:x, Number.new(1)),
#         Assign.new(:x, Number.new(2))
#     ),
#     {x: Number.new(0)}
# )
#
# machine.run

# machine = Machine.new(
#        Sequence.new(
#             Assign.new(:x, Number.new(10)),
#             Assign.new(:y, Number.new(20))
#        ),
#        {}
# )
#
# machine.run

# machine = Machine.new(
#        While.new(
#            LessThan.new(Variable.new(:x), Number.new(10)),
#            Sequence.new(
#                        Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))),
#                        Assign.new(:y, Add.new(Variable.new(:y), Number.new(1)))
#            )
#        ),
#        {x: Number.new(0), y: Number.new(0)}
# )
#
# machine.run

# proc = eval("-> { 5 }")
# puts proc
# puts proc.call()

proc = -> x, y { x + y}
puts proc.call(1, 2)

# class Element < Struct.new(:val)
#
# end
#
# puts [Element.new(1), Element.new(2), Element.new(3)].map{|elem| elem.to_s}
# puts [Element.new(1), Element.new(2), Element.new(3)].map(&:to_s)
# puts [Element.new(1), Element.new(2), Element.new(3)].map(&1.method(:==))

# puts [1,2,3] & [2,3,4]