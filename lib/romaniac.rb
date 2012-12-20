require 'romaniac/converter'

def Roman(int)
  Romaniac.new(int)
end

class Romaniac
  # The VERSION file must be in the root directory of the library.
  VERSION_FILE = File.expand_path('../../VERSION', __FILE__)

  VERSION = File.exist?(VERSION_FILE) ?
    File.read(VERSION_FILE) : '(could not find VERSION file)'

  # The maximum possible Roman numeral.
  LIMIT = 3999

  DivisionError = Class.new(StandardError)

  def initialize(int)
    validate(int)
    @int   = int
    @roman = Romaniac::Converter.to_roman(int)
  end

  def inspect
    "(Roman: #@roman)"
  end

  def to_i
    @int
  end

  def ==(other)
    @int == other.to_i
  end

  def +(other)
    self.class.new(@int + other.to_i)
  end

  def -(other)
    self.class.new(@int - other.to_i)
  end

  def /(other)
    int, fraction = @int.divmod(other.to_i)
    if fraction.zero?
      self.class.new(int)
    else
      raise Romaniac::DivisionError, "quotient isn't an integer"
    end
  end

  private

  def validate(int)
    if !int.is_a?(Fixnum)
      raise TypeError, "can't convert #{ int.class } into Roman"
    end

    if int <= 0
      raise RangeError, 'integer is too small to convert into Roman'
    elsif int > LIMIT
      raise RangeError, 'integer is too big to convert into Roman'
    end
  end
end
