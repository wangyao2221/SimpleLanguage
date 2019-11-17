require 'DFARuleBook'
class DFARuleBook < Struct.new(:rules)
  def next_state(state, character)

  end

  def rule_for(state, character)
    rules.detect {|rule| rule.applies_to?(state, character)}
  end
end
