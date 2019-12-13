class LexicalAnalyzer < Struct.new(:string)
  GRAMMAR = [
      {token: 'i', pattern: /if/}
  ]
end
