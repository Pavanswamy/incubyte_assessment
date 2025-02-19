require 'test_helper'

class StringCalculatorTest < ActiveSupport::TestCase
  def setup
    @calculator = StringCalculator.new
  end

  test 'returns 0 for empty string' do
    assert_equal 0, @calculator.add("")
  end

  test 'returns the number when there is only one number' do
    assert_equal 5, @calculator.add("5")
  end

  test 'returns the sum of multiple numbers' do
    assert_equal 6, @calculator.add("1,2,3")
    assert_equal 15, @calculator.add("4,5,6")
  end

  test 'returns the sum with numbers separated by newlines' do
    assert_equal 6, @calculator.add("1\n2,3")
    assert_equal 6, @calculator.add("1\n2\n3")
  end

  test 'returns the sum when using a custom delimiter' do
    assert_equal 6, @calculator.add("//;\n1;2;3")
    assert_equal 15, @calculator.add("//|\n4|5|6")
  end

  test 'raises error for negative numbers' do
    assert_raises(RuntimeError, "negative numbers not allowed: -2, -4") do
      @calculator.add("1,-2,3,-4")
    end
  end

  test 'raises error for multiple negative numbers' do
    assert_raises(RuntimeError, "negative numbers not allowed: -2, -3") do
      @calculator.add("1,-2,-3,4")
    end
  end
end
