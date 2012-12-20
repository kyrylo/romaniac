Dir[File.expand_path('../ext/*.rb', __FILE__)].each do |file|
  require file
end
