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