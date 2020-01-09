TRUE = -> x { -> y { x } }
FALSE = -> x { -> y { y } }

def to_boolean(proc)
  proc[true][false]
end

# 如果要正确使用IF就要限定b及其参数的类型吧？因此引入了类型的问题？
#IF = -> b {
#  -> x {
#    -> y {
#      b[x][y]
#    }
#  }
#}
IF = -> b { b } # 和上面等价
