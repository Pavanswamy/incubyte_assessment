class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?
  
      delimiter, numbers = extract_delimiter(numbers)
      num_array = numbers.split(delimiter).map(&:to_i)
  
      raise_negative_error(num_array)
  
      num_array.sum
    end
  
    private
  
    def extract_delimiter(numbers)
      if numbers.match?(/^\/\/(.+)\n/)
        delimiter = numbers[/^\/\/(.+)\n/, 1]  # Extract delimiter
        # If the delimiter is a single character, we can split it easily
        [delimiter, numbers.split("\n", 2).last]
      else
        # Default delimiters are commas and newlines
        [/[,\n]/, numbers]
      end
    end
  
    def raise_negative_error(numbers)
      negatives = numbers.select(&:negative?)
      raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
    end
end
  