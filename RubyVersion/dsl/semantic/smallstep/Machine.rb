class Machine < Struct.new(:expression,:environment)
  def step
    self.expression,self.environment = expression.reduce(environment)
  end

  def run
    while expression.reducible?
      puts "#{expression} , #{environment}"
      step
    end

    puts "#{expression} , #{environment}"
  end
end
