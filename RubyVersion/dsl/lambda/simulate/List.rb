EMPTY = PAIR[TRUE][TRUE]
UNSHIFT = -> l { ->  x {
  PAIR[FALSE][PAIR[x][l]]
} }
IS_EMPTY = LEFT
FIRST = -> l { LEFT[RIGHT[l]] }
REST = -> l { RIGHT[RIGHT[l]] }

def to_array(proc)
  array = []

  until to_boolean(IS_EMPTY[proc])
    array.push(FIRST[proc])
    proc = REST[proc]
  end

  array
end

RANGE = Z[-> f {
  -> m { -> n {
    IF[IS_LESS_OR_EQUAL[m][n]][
        -> x {
          UNSHIFT[f[INCREMENT[m]][n]][m][x]
        }
    ][
        EMPTY
    ]
  } }
}]

FOLD =
    Z[-> f {
      -> l { -> x { -> g {
        IF[IS_EMPTY[l]][
            x
        ][
            -> y {
              g[f[REST[l]][x][g]][FIRST[l]][y]
            }
        ]
      } } }
    }]