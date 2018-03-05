class ExpressionEvaluator
  def self.parse(string)
    complex_exps = string.scan(/-\s\d\s\d/)
    simple_exps = string.gsub(/-\s\d\s\d/, '')
    complex_sum(complex_exps) + simple_sum(simple_exps)
  end 

  def self.complex_sum(array)
    array.inject(0) { |sum, exp| sum + (exp[2].to_i - exp[4].to_i) }
  end
    
  def self.simple_sum(string)
    return 0 if string.empty?
    string.gsub('- ', '-').split.inject(0) { |sum, num| sum + num.to_i }
  end
end
