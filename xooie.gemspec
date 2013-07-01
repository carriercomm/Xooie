require 'json'

FileUtils.mkdir_p 'app/vendor/javascripts'

FileUtils.cp 'xooie.js', 'app/vendor/javascripts'
FileUtils.cp_r 'xooie', 'app/vendor/javascripts'

json = File.read('package.json')
config = JSON.parse(json)

Gem::Specification.new do |s|
  s.name        = config['name']
  s.version     = config['version']
  s.summary     = config['description']
  s.date        = Time.now
  s.description = config['description']
  s.license     = config['license']['type']
  s.authors     = config['author']['name']
  s.email       = config['author']['email']
  s.homepage    = config['homepage']
  s.files       = Dir[
    'app/vendor/javascripts/xooie.js',
    'app/vendor/javascripts/xooie/**/*'
  ]
end