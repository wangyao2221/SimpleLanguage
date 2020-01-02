class DTMRuleBook < Struct.new(:rules)
  def next_configuration(configuration)
    rule_for(configuration).follow(configuration)
  end

  def rule_for(configuration)
    rules.detect {|rule| rule.applies_to?(configuration)}
  end
end