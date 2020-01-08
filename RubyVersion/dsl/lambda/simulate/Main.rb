puts -> x { x + 2 }.call(1)
puts -> x, y { x + y }.call(3, 4)
puts -> x { -> y { x + y }}.call(3).call(4)

p = -> n { n * 2 }
q = -> x { p.call(2) }
puts p.call(2)
puts q.call(2)

puts -> x { x + 5}[5]

TRUE = -> x { -> y { x } }
FALSE = -> x { -> y { y } }
puts FALSE[true][false]

#IF = -> b {
#  -> x {
#    -> y {
#      b[x][y]
#    }
#  }
#}
IF = -> b { b } # 和上面等价
puts IF[FALSE][true][false]