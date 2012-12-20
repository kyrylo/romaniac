require 'romaniac/numerals_converter'

def Roman(int)
  Romaniac.new(int)
end

class Romaniac
  # The VERSION file must be in the root directory of the library.
  VERSION_FILE = File.expand_path('../../VERSION', __FILE__)

  VERSION = File.exist?(VERSION_FILE) ?
    File.read(VERSION_FILE) : '(could not find VERSION file)'

  def initialize(int)
    @int   = int
    @roman = NumeralsConverter.to_roman(int)
  end

  def inspect
    "(Roman: #{ @roman })"
  end
end
