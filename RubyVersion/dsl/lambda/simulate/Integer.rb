ZERO = -> p { -> x { x } }
ONE = -> p { -> x { p[x] } }
TWO = -> p { -> x { p[p[x]] } }
THREE = -> p { -> x { p[p[p[x]]] } }
FOUR = -> p { -> x { p[p[p[p[x]]]] } }
FIVE = -> p { -> x { p[p[p[p[p[x]]]]] } }

def to_integer(proc)
  proc[-> n { n + 1 }][0]
end