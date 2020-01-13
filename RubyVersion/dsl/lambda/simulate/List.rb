EMPTY = PAIR[TRUE][TRUE]
UNSHIFT = -> l { ->  x {
  PAIR[FALSE][PAIR[x][l]]
} }
IS_EMPTY = LEFT
FIRST = -> l { LEFT[RIGHT[l]] }
REST = -> l { RIGHT[RIGHT[l]] }