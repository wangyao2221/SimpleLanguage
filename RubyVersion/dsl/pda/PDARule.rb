class PDARule < Struct.new(:state, :character, :next_state, :pop_character, :push_characters)
  def applies_to?(configuration, character)
    self.state == configuration.state && self.pop_character == configuration.stack.top && self.character == character
  end

  def follow(configuration)
    # 这一行好像有点问题，没有判断stack顶端的符合和要弹出的符号是否相等，但这里只用在匹配到了符合的configuration时调用，因此不会出错
    PDAConfiguration.new(next_state, next_stack(configuration))
  end
  #[1,2,3].reverse.inject(['a']) {|arr,ch| arr+[ch]} => ["a", 3, 2, 1]

  def next_stack(configuration)
    popped_stack = configuration.stack.pop

    push_characters.reverse.inject(popped_stack) { |stack, character| stack.push(character) }
  end
end
