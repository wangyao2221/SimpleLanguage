class Number < Struct.new(:value)
  def evaluate(environment)
    self
  end
end

class Variable < Struct.new(:name)
  def evaluate(environment)
    environment[name]
  end
end

class Add < Struct.new(:left, :right)
  def evaluate(environment)
    Number.new(left.evaluate(environment).value + right.evaluate(environment).value)
  end
end

class Multiply < Struct.new(:left, :right)
  def evaluate(environment)
    Number.new(left.evaluate(environment).value * right.evaluate(environment).value)
  end
end

class Boolean < Struct.new(:value)
  def inspect
    "<<#{self}>>"
  end

  def evaluate(environment)
    self
  end
end

class LessThan < Struct.new(:left,:right)
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value < right.evaluate(environment).value)
  end
end

class GreaterThan < Struct.new(:left,:right)
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value > right.evaluate(environment).value)
  end
end

class EQ < Struct.new(:left,:right)
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value == right.evaluate(environment).value)
  end
end