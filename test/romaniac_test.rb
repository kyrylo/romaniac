require 'helper'

class RomaniacTest < MiniTest::Unit::TestCase
  def test_arabic_to_roman_conversion
    assert_equal '(Roman: I)', Roman(1).inspect
    assert_equal '(Roman: CI)', Roman(101).inspect
    assert_equal '(Roman: MMMCMXCIX)', Roman(3999).inspect
  end

  def test_roman_to_arabic_conversion
    assert_equal 201, Roman(201).to_i
    assert_equal 3000, Roman(3000).to_i
    assert_equal 66, Roman(66).to_i
  end

  def test_zero_to_roman_conversion_raises_exception
    e = assert_raises RangeError do
      Roman(0)
    end
    assert_match /integer is too small to convert into Roman/, e.message
  end

  def test_negative_arabic_to_roman_conversion_raises_exception
    e = assert_raises RangeError do
      Roman(-1)
    end
    assert_match /integer is too small to convert into Roman/, e.message
  end

  def test_noninteger_argument_value_raises_exception
    e = assert_raises TypeError do
      Roman(:'10')
    end
    assert_match /can't convert Symbol into Roman/, e.message

    e = assert_raises TypeError do
      Roman(10.55)
    end
    assert_match /can't convert Float into Roman/, e.message
  end

  def test_too_big_integer_value_raises_exception
    e = assert_raises RangeError do
      Roman(4000)
    end
    assert_match /integer is too big to convert into Roman/, e.message
  end

  def test_addition_works_correctly
    assert_equal Roman(51), Roman(25) + Roman(26)
  end

  def test_too_big_sum_raises_exception
    e = assert_raises RangeError do
      Roman(2000) + Roman(3000)
    end
    assert_match /integer is too big to convert into Roman/, e.message
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
