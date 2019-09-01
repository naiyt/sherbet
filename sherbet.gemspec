lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sherbet/version"

Gem::Specification.new do |spec|
  spec.name          = "sherbet"
  spec.version       = Sherbet::VERSION
  spec.authors       = ["Nate Collings"]
  spec.email         = ["nate@natecollings.com"]

  spec.summary       = %q{A small gem to demonstrate Sorbet for the downtown URUG meetup}
  spec.homepage      = "https://natecollings.com"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "faker", "~> 2.2.1"
  spec.add_dependency "thor", "~> 0.20.3"
end
