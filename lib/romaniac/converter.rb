class Romaniac
  module Converter

    MAP = {
      1    => 'I',
      4    => 'IV',
      5    => 'V',
      9    => 'IX',
      10   => 'X',
      40   => 'XL',
      50   => 'L',
      90   => 'XC',
      100  => 'C',
      400  => 'CD',
      500  => 'D',
      900  => 'CM',
      1000 => 'M'
    }

    INVERTED_MAP = [
      ['M' , 1000],
      ['CM',  900],
      ['D' ,  500],
      ['CD',  400],
      ['C' ,  100],
      ['XC',   90],
      ['L' ,   50],
      ['XL',   40],
      ['X' ,   10],
      ['IX',    9],
      ['V' ,    5],
      ['IV',    4],
      ['I' ,    1]
    ]

    # Arabic numerals are used as key points that come in handy when the library
    # dynamically creates new numerals.
    KEY_POINTS = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

    # Raw table of Arabic and Roman numerals. Fills out lazily.
    ARABIC_ROMAN = Hash.new do |hash, int|
                     hash[int] = addends_of(int).map { |addend|
                       if hash.has_key?(addend)
                         hash[addend]
                       else
                         arabic_to_roman(addend)
                       end
                     }.join('')
                   end

    class << self
      # @api private
      # @example
      #   addends_of(6969) #=> [6000, 900, 60, 9]
      # @param [Integer] int
      # @return [Array] addends of +int+ with base of 10
      def addends_of(int)
        addends = []
        pad     = 0
        while int > 0
          int, elem = int.divmod(10)
          addends.unshift(10**pad * elem)
          pad += 1
        end
        addends
      end

      # @api private
      # @example
      #   arabic_to_roman(142) #=> "CXLII"
      # @param [Integer] int
      # @return [String]
      def arabic_to_roman(int)
        roman = ''
        while int > 0
          point = KEY_POINTS.find { |key_point| key_point <= int }
          times, int = int.divmod(point)
          roman << MAP[point] * times
        end
        roman
      end

      # @api private
      def to_roman(int)
        ARABIC_ROMAN[int]
      end

      # @api private
      # Also, stores the results of calculations into the ARABIC_ROMAN hash.
      # @example
      #   arabic_to_roman("CXLII") #=> 142
      # @param [String] roman
      # @return [Integer]
      def roman_to_arabic(roman)
        arabic = 0
        r = roman.dup
        INVERTED_MAP.each do |k, v|
          while r.index(k) == 0
            arabic += v
            r.slice!(k)
          end
        end
        ARABIC_ROMAN.merge!({ arabic => roman })
        arabic
      end
    end

  end
end
