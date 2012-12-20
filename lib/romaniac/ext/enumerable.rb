module Enumerable
  def with_roman_index(offset = 1)
    return to_enum(:with_roman_index, offset) unless block_given?
    each do |o|
      val = yield(o, Roman(offset))
      offset += 1
      val
    end
  end

  def each_with_roman_index(&block)
    with_roman_index(&block)
  end
end
