class ExpressionEvaluator
  # Brute Force attempt, passing all tests, but needs to be more efficient and readable
  def self.parse(string)
    sum = 0
    char_array = string.split
    char_array.each_with_index do |char, i|
      next unless char == '-' && char_array[i + 2]
      if char_array[i + 2].to_i == 0
        char_array[i + 1] = char + char_array[i + 1]
      else
        char_array[i + 2] = char + char_array[i + 2]
      end
    end
    char_array.map(&:to_i).reduce(&:+)
  end
end

def self.parse_recursive(string, sum = 0, operator = '')
    char = string.slice!(string[0])
    if string.length > 0
      char.match(/\+|\-/) &&
        operator = char
      operator == '+' ?
        sum += char.to_i : sum -= char.to_i
      self.parse_recursive(string.delete(' '), sum, operator)
    else
      sum
    end
  end
