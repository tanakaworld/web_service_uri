# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "web_service_uri/version"

Gem::Specification.new do |spec|
  spec.name = "web_service_uri"
  spec.version = WebServiceUri::VERSION
  spec.authors = ["tanakaworld"]
  spec.email = ["yutaro.tanaka.world@gmail.com"]

  spec.summary = %q{🌈 URI parser for web services in the world.}
  spec.description = %q{🌈 URI parser for web services in the world.}
  spec.homepage = "http://tanakaworld.github.io/web_service_uri"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) {|f| File.basename(f)}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
