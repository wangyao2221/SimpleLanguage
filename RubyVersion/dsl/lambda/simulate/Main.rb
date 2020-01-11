$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'Integer'
require 'Boolean'
require 'Predicate'
require 'Pair'
require 'Calculation'

puts -> x { x + 2 }.call(1)
puts -> x, y { x + y }.call(3, 4)
puts -> x { -> y { x + y }}.call(3).call(4)

p = -> n { n * 2 }
q = -> x { p.call(2) }
puts p.call(2)
puts q.call(2)

puts -> x { x + 5}[5]

# 数值
puts '数值'
puts to_integer(ONE)

# 布尔值
puts '布尔值'
puts to_boolean(FALSE)
puts to_boolean(TRUE)
puts IF[FALSE][true][false]
puts IF[TRUE][true][false]

# 谓词
puts '谓词'
puts to_boolean(IS_ZERO[ZERO])
puts to_boolean(IS_ZERO[ONE])

# 有序对
puts '有序对'
pair = PAIR[ONE][TWO] # 不全调用可以作为一个类型，在LEFT和RIGHT操作时给最后一个参数，就是函数f，LEFT和RIGHT的函数f分别是x、y
puts to_integer(LEFT[pair])
puts to_integer(RIGHT[pair])

# 数值运算
puts '数值运算'
puts to_integer(INCREMENT[ONE])
puts to_integer(DECREMENT[THREE])
puts to_integer(ADD[THREE][TWO])
puts to_integer(SUBTRACT[THREE][TWO])
puts to_integer(MULTIPLY[THREE][TWO])
puts to_integer(POWER[THREE][TWO])
puts to_integer(MOD[THREE][TWO])

# test
#puts 'test'
#test = -> x {
#  if x > 0
#    test[x - 1]
#  else
#    x
#  end
#}
#
#puts test[5]