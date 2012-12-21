class Romaniac::Const

  ROMAN_PATTERN =
    /\A(?i)M{0,3}(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])\z/i

  # Handles the case when this file is required
  # in the middle of a running program.
  Romaniac::Converter::ARABIC_ROMAN.each_pair do |k, v|
    Object.const_set(v, Roman(k))
  end

  def self.define!(name)
    if Romaniac::Converter::ARABIC_ROMAN.has_value?(name)
      if RUBY_VERSION == '1.8.7'
        arabic = Romaniac::Converter::ARABIC_ROMAN.index(name)
      else
        arabic = Romaniac::Converter::ARABIC_ROMAN.key(name)
      end
    else
      arabic = Romaniac::Converter.roman_to_arabic(name)
    end
    Object.const_set(name, Roman(arabic))
  end

end

class Object
  def self.const_missing(name)
    if (name = name.to_s) =~ Romaniac::Const::ROMAN_PATTERN
      Romaniac::Const.define!(name)
    else
      super
    end
  end
end
