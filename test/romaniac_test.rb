require 'helper'

class RomaniacTest < MiniTest::Unit::TestCase
  def test_arabic_to_roman_conversion
    assert_equal '(Roman: X)', Roman(10).inspect
    assert_equal '(Roman: CI)', Roman(101).inspect
    assert_equal '(Roman: CCI)', Roman(201).inspect
  end

  def test_roman_to_arabic_conversion
    flunk
  end

  def test_zero_to_roman_conversion_raises_exception
    flunk
  end

  def test_negative_arabic_to_roman_conversion_raises_exception
    flunk
  end

  def test_noninteger_argument_value_raises_exception
    flunk
  end

  def test_too_big_integer_value_raises_exception
    flunk
  end

  def test_addition_works_correctly
    flunk
  end

  def test_addition_raises_exception_when_the_result_is_too_big
    flunk
  end

  def test_subtraction_works_correctly
    flunk
  end

  def test_subtraction_raises_exception_when_the_result_is_negative
    flunk
  end

  def test_subtraction_raises_exception_when_the_result_is_zero
    flunk
  end

  def test_division_works_correctly
    flunk
  end

  def test_division_truncates_fractional_part_of_quotient
    flunk
  end

  def test_division_raises_exception_when_the_integer_part_of_quotient_is_zero
    flunk
  end

  def test_multiplication_works_correctly
    flunk
  end

  def test_multiplication_raises_exception_when_the_result_is_too_big
    flunk
  end
end
