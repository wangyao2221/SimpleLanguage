require '../pda/PDARule'

symbol_rules = [
    # <statement> ::= <while> | <assign>
    PDARule.new(2, nil, 2, 'S', ['W']),
    PDARule.new(2, nil, 2, 'S', ['A']),

    # <while> ::= "w" "(" <expression> ")" "{" <statement> "}"
    PDARule.new(2, nil, 2, 'W', ['W', '(', 'E', ')', '{', 'S', '}']),

    # <assign> ::= "v" "=" <expression>
    PDARule.new(2, nil, 2, 'A', ['v', '=', 'E']),

    # <expression> ::= <less-than>
    PDARule.new(2, nil, 2, 'E', ['L']),

    # <less-than> ::= <multiply> "<" <less-than> | <multiply>
    PDARule.new(2, nil, 2, 'L', ['M', '<', 'L']),
    PDARule.new(2, nil, 2, 'L', ['M']),

    # <multiply> ::= <term> "*" <multiply> | <term>
    PDARule.new(2, nil, 2, 'M', ['T', '*', 'M']),
    PDARule.new(2, nil, 2, 'M', ['T']),

    # <term> ::= "n" | "v"
    PDARule.new(2, nil, 2, 'T', ['n']),
    PDARule.new(2, nil, 2, 'T', ['v'])
]