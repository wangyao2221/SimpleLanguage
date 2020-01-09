PAIR = -> x { -> y { -> f { f[x][y] }}}
LEFT = -> p { p[-> x { -> y { x } } ] } # 将x作为函数f
RIGHT = -> p { p[-> x { -> y { y } } ] } # 将y作为函数f
