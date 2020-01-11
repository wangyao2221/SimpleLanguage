INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }
SLIDE = -> p { PAIR[RIGHT[p]][INCREMENT[RIGHT[p]]] }
DECREMENT = -> n { LEFT[n[SLIDE][PAIR[ZERO][ZERO]]] }
ADD = -> m { -> n { n[INCREMENT][m] } } # 在m的基础上进行n个INCREMENT
SUBTRACT = -> m { -> n { n[DECREMENT][m] } }
MULTIPLY = -> m { -> n { n[ADD[m]][ZERO] } }
POWER = -> m { -> n { n[MULTIPLY[m]][ONE] } }
IS_LESS_OR_EQUAL = -> m { -> n { IS_ZERO[SUBTRACT[m][n]] } }
MOD = -> m { -> n  {
  IF[IS_LESS_OR_EQUAL[n][m]][
      -> x { MOD[SUBTRACT[m][n]][n][x] } # 不明白这个-> x
  ][
      m
  ]
} }
