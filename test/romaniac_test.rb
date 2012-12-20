require 'helper'

class RomaniacTest < MiniTest::Unit::TestCase
  def test_arabic_to_roman_conversion
    assert_equal '(Roman: I)', Roman(1).inspect
    assert_equal '(Roman: CI)', Roman(101).inspect
    assert_equal '(Roman: MMMCMXCIX)', Roman(3999).inspect
  end

  def test_arabic_to_roman_conversion_from_string
    assert_equal '(Roman: I)', Roman('1').inspect
    assert_equal '(Roman: CI)', Roman('101').inspect
    assert_equal '(Roman: MMMCMXCIX)', Roman('3999').inspect
  end

  def test_malformed_string_argument_raises_exception
    e = assert_raises ArgumentError do
      Roman('...')
    end
    assert_match /invalid value for Roman\(\): "..."/, e.message

    e = assert_raises ArgumentError do
      Roman('aaa11')
    end
    assert_match /invalid value for Roman\(\): "aaa11"/, e.message

    e = assert_raises ArgumentError do
      Roman('11aaa')
    end
    assert_match /invalid value for Roman\(\): "11aaa"/, e.message

    e = assert_raises ArgumentError do
      Roman(' 11 ')
    end
    assert_match /invalid value for Roman\(\): " 11 "/, e.message

    e = assert_raises ArgumentError do
      Roman('4444')
    end
    assert_match /invalid value for Roman\(\): "4444"/, e.message

    e = assert_raises ArgumentError do
      Roman('4444sdad')
    end
    assert_match /invalid value for Roman\(\): "4444sdad"/, e.message

    e = assert_raises ArgumentError do
      Roman('0')
    end
    assert_match /invalid value for Roman\(\): "0"/, e.message

    e = assert_raises ArgumentError do
      Roman('-4444')
    end
    assert_match /invalid value for Roman\(\): "-4444"/, e.message
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

  def test_subtraction_works_correctly
    assert_equal Roman(1), Roman(26) - Roman(25)
  end

  def test_too_small_difference_raises_exception
    e = assert_raises RangeError do
      Roman(26) - Roman(26)
    end
    assert_match /integer is too small to convert into Roman/, e.message
  end

  def test_division_works_correctly
    assert_equal Roman(5), Roman(20) / Roman(4)
  end

  def test_nonint_quotient_raises_exception
    e = assert_raises Romaniac::DivisionError do
      Roman(20) / Roman(3)
    end
    assert_match /quotient isn't an integer/, e.message
  end

  def test_multiplication_works_correctly
    assert_equal Roman(20), Roman(5) * Roman(4)
  end

  def test_too_big_product_raises_exception
    e = assert_raises RangeError do
      Roman(400) * Roman(300)
    end
    assert_match /integer is too big to convert into Roman/, e.message
  end

  def test_comparison
    assert Roman(20) == Roman(20)
    assert Roman(20) > Roman(19)
    assert Roman(20) < Roman(21)
    assert Roman(20) != Roman(1)
    assert Roman(20) >= Roman(20)
    assert Roman(20) <= Roman(20)
  end
end
