
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "estratto/version"

Gem::Specification.new do |spec|
  spec.name          = "estratto"
  spec.version       = Estratto::VERSION
  spec.authors       = ["Henrique A. Lavezzo"]
  spec.email         = ["me@hlavezzo.run"]

  spec.summary       = %q{Parsing fixed width files made easy}
  spec.homepage      = "https://github.com/Rynaro/estratto"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency  "charlock_holmes"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-nav"
end
