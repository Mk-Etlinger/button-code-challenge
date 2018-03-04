class ExpressionEvaluator
  # Regex implementation
  def self.parse(string)
    # separate the complex exps from the simple
    complex_exps = string.scan(/-\s\d\s\d/)
    simple_exps = string.gsub(/-\s\d\s\d/, '')
    # Add the sum of the complex exps to the sum of the simple exps
    sum_complex_exp(complex_exps) + sum_simple_exp(simple_exps)
  end 

  def self.sum_complex_exp(array)
    sum = 0
    array.each do |exp|
      sum += (exp[2].to_i - exp[4].to_i)
    end
    sum
  end
    
  def self.sum_simple_exp(string)
    # string is empty if there's no simple exps
    return 0 if string.empty?
    # remove spaces between - and split to array. Then convert to int and reduce
    string.gsub('- ', '-').split.map(&:to_i).reduce(&:+)
  end
end
