class Number < Struct.new(:value)
  def to_ruby
    "-> e { #{value.inspect} }"
  end
end

class Variable < Struct.new(:name)
  def to_ruby
    "-> e { e[#{name.inspect}] }"
  end
end

class Add < Struct.new(:left, :right)
  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) +  (#{right.to_ruby}).call(e) }"
  end
end

class Multiply < Struct.new(:left, :right)
  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) *  (#{right.to_ruby}).call(e) }"
  end
end

class Boolean < Struct.new(:value)
  def to_ruby
    "-> e { #{value.inspect} }"
  end
end

class LessThan < Struct.new(:left,:right)
  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) <  (#{right.to_ruby}).call(e) }"
  end
end

class GreaterThan < Struct.new(:left,:right)
  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) >  (#{right.to_ruby}).call(e) }"
  end
end

class EQ < Struct.new(:left,:right)
  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) ==  (#{right.to_ruby}).call(e) }"
  end
end