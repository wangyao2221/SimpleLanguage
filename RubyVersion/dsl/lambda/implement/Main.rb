$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'LCVariable'
require 'LCFunction'
require 'LCCall'

one = LCFunction.new(:p,
                 LCFunction.new(:x,
                            LCCall.new(LCVariable.new(:p), LCVariable.new(:x))
                 )
)
puts one

expression =
    LCCall.new(
        LCCall.new(LCVariable.new(:x), LCVariable.new(:y)),
        LCFunction.new(:y, LCCall.new(LCVariable.new(:y), LCVariable.new(:x)))
    )
puts expression
puts expression.replace(:x, LCVariable.new(:z))
puts expression.replace(:y, LCVariable.new(:z))