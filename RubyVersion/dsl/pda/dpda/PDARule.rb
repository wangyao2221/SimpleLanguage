class PDARule < Struct.new(:state, :character, :next_state, :pop_character, :push_character)
  def applies_to?(configuration, character)
    self.state == configuration.state && self.pop_character == configuration.stack.top && self.character == character
  end
end
