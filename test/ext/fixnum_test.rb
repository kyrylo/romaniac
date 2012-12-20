require 'helper'

class FixnumTest < MiniTest::Unit::TestCase
  def test_converting_a_number_to_a_roman_numeral
    assert_equal Roman(124), 124.to_roman
  end

  def test_conversion_of_too_big_numbers_raises_exception
    e = assert_raises RangeError do
      19214.to_roman
    end
    assert_match /integer is too big to convert into Roman/, e.message
  end

  def test_conversion_of_zero_raises_exception
    e = assert_raises RangeError do
      0.to_roman
    end
    assert_match /integer is too small to convert into Roman/, e.message
  end

  def test_conversion_of_negative_numbers_raises_exception
    e = assert_raises RangeError do
      0.to_roman
    end
    assert_match /integer is too small to convert into Roman/, e.message
  end
end
