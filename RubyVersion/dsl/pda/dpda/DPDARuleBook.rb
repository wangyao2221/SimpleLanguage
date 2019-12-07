class DPDARuleBook < Struct.new(:rules)
  def next_state(configuration, character)
    rule_for(configuration, character).follow
  end

  def rule_for(configuration, character)
    rules.detect {|rule| rule.applies_to?(configuration, character)}
  end
end