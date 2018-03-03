class ExpressionEvaluator
  # Brute Force attempt, passing all tests, but needs to be more efficient and readable
  def self.parse(string)
    sum = 0
    char_array = string.split
    char_array.each_with_index do |char, i|
      sum += char.to_i
      next unless char == '-' && char_array[i + 2]
      if char_array[i + 2].to_i == 0
        char_array[i + 1] = char + char_array[i + 1]
      else
        char_array[i + 2] = char + char_array[i + 2]
      end
    end
    sum
  end
end
