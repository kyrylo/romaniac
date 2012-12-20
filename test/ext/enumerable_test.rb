require 'helper'

class EnumerableTest < MiniTest::Unit::TestCase
  def test_with_roman_index_method
    assert_equal [[:a, Roman(1)], [:b, Roman(2)], [:c, Roman(3)]],
                 [:a, :b, :c].map.with_roman_index.to_a
  end

  def test_with_roman_index_method_offset
    assert_equal [[:a, Roman(10)], [:b, Roman(11)], [:c, Roman(12)]],
                 [:a, :b, :c].map.with_roman_index(10).to_a
  end
end
