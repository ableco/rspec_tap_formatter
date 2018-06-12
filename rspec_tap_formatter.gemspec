lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "rspec_tap_formatter"

Gem::Specification.new do |spec|
  spec.name          = "rspec_tap_formatter"
  spec.version       = RspecTapFormatter::VERSION
  spec.authors       = ["Gustavo Beathyate", "Javier Olaechea"]
  spec.email         = ["gustavo.bt@able.co", "javier@able.co"]

  spec.summary       = "Adds TAP output format to RSpec"
  spec.description   = "Adds TAP output format to RSpec so that you can run it on the Heroku CI"
  spec.homepage      = "https://github.com/ableco/rspec_tab_formatter"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec-core", "~> 3.7.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
