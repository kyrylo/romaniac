Gem::Specification.new do |s|
  s.name         = 'romaniac'
  s.version      = '0.0.1pre'
  s.date         = Time.now.strftime('%Y-%m-%d')
  s.summary      = 'The library for Roman numerals maniacs.'
  s.description  = 'The Romaniac library converts Arabic numerals to Roman numerals and vice versa.'
  s.author       = 'Kyrylo Silin'
  s.email        = 'kyrylosilin@gmail.com'
  s.homepage     = 'https://github.com/kyrylo/romaniac'
  s.licenses     = 'zlib'

  s.require_path = 'lib'
  s.files        = `git ls-files`.split "\n"

  s.add_development_dependency 'rake'
end
