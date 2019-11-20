class NFARuleBook < Struct.new(:rules)
  def next_states(state, character)
    rules_for(state, character).map(:follow)
  end

  def rules_for(state, character)
    rules.select {|rule| rule.applies_to?(state, character)}
  end
end