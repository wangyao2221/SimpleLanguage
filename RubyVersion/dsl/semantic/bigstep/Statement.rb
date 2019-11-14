class DoNothing
  def evaluate(environment)
    environment
  end
end
class Assign < Struct.new(:name, :expression)
  def evaluate(environment)
    environment.merge({name => expression.evaluate(environment)})
  end
end

class If < Struct.new(:condition, :consequence, :alternative)
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      consequence.evaluate(environment)
    when Boolean.new(false)
      alternative.evaluate(environment)
    end
  end
end

class Sequence < Struct.new(:first, :second)
  def evaluate(environment)
    second.evaluate(first.evaluate(environment))
  end
end

class While < Struct.new(:condition, :body)
  def evaluate(environment)
    If.new(condition, Sequence.new(body, self), DoNothing.new).evaluate(environment)
  end
end