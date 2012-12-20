require 'helper'

class Romaniac::ConstTest < MiniTest::Unit::TestCase

  def test_that_they_just_work!
    assert_equal Roman(100), C
    assert_equal Roman(103), C + III
  end

end
