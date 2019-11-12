class DoNothing
  def to_ruby
    "-> e { e }"
  end
end
class Assignment < Struct.new(:name, :expression)
  def to_ruby
    "-> e { e.merge({#{name.inspect} => (#{expression.to_ruby}).call(e) }) }"
  end
end

class If < Struct.new(:condition, :consequence, :alternative)
  def to_ruby
    "-> e { if (#{condition.to_ruby}).call(e)? " +
      " then (#{consequence.to_ruby}).call(e) " +
      " else (#{alternative.to_ruby}).call(e)" +
      " end }"
  end
end

class Sequence < Struct.new(:first, :second)
  def to_ruby
    "-> e { (#{second.to_ruby}).call((#{first.to_ruby}).call(e)) }"
  end
end

class While < Struct.new(:condition, :body)
  def evaluate(environment)
    If.new(condition, Sequence.new(body, self), DoNothing.new).evaluate(environment)
  end
  def to_ruby
    "-> e { while (#{condition.to_ruby}).call(e)\n " +
        " e = (#{body.to_ruby}).call(e)\n " +
        " end\n " +
        " e" +
        "}"
  end
end