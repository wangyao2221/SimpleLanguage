$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'Integer'
require 'Boolean'
require 'Predicate'
require 'Pair'
require 'Calculation'
require 'List'
require 'String'

puts -> x { x + 2 }.call(1)
puts -> x, y { x + y }.call(3, 4)
puts -> x { -> y { x + y } }.call(3).call(4)

p = -> n { n * 2 }
q = -> x { p.call(2) }
puts p.call(2)
puts q.call(2)

puts -> x { x + 5 }[5]

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

# List
puts 'List'
my_list = UNSHIFT[
    UNSHIFT[
        UNSHIFT[EMPTY][THREE]
    ][TWO]
][ONE]
puts to_integer(FIRST[REST[my_list]])
my_integer_list = to_array(my_list).map { |p| to_integer(p) }
puts my_integer_list.to_s
# range
puts 'range'
my_range = RANGE[ONE][THREE]
puts to_array(my_range).map { |p| to_integer(p) }.to_s
# fold
puts 'fold'
puts to_integer(FOLD[RANGE[ONE][FIVE]][ZERO][ADD])
puts to_integer(FOLD[RANGE[ONE][FIVE]][ONE][MULTIPLY])

# map
puts 'map'
my_list = MAP[RANGE[ONE][FIVE]][INCREMENT]
puts to_array(my_list).map { |p| to_integer(p) }

# string
puts 'string'
puts to_char(ZED)
puts to_string(FIZZBUZZ)
puts to_array(TO_DIGITS[FIVE]).map { |p| to_integer(p) }
puts to_array(TO_DIGITS[POWER[FIVE][THREE]]).map { |p| to_integer(p) }

# solution
puts 'solution'
solution = MAP[RANGE[ONE][FIVE]][-> n {
  IF[IS_ZERO[MOD[n][TWO]]][
      FIZZBUZZ
  ][IF[IS_ZERO[MOD[n][THREE]]][
        FIZZ
    ][IF[IS_ZERO[MOD[n][FIVE]]][
          BUZZ
      ][
          TO_DIGITS[n]
      ]]]
}]

to_array(solution).each do |p|
  puts to_string(p)
end
# test
#puts 'test'
#test = -> n {
#  if to_boolean(IS_LESS_OR_EQUAL(n))
#    test[SUBTRACT[n][ONE]]
#  else
#
#    n
#  end
#}
#
#puts test[5]