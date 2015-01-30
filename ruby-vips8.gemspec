# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby-vips8"
  s.version = "0.1"
  s.required_ruby_version = %q{>= 1.9.3}

  s.summary = "gobject-introspection-based Ruby bindings for libvips8"
  s.description = "Bindings for libvips8, with overrides."
  s.license = 'LGPL-2.1'

  s.authors = ["John Cupitt"]
  s.email = ["jcupitt@gmail.com"]
  s.homepage = "http://www.github.com/jcupitt/ruby-vips8"

  s.files = Dir['{lib,test,tasks,examples}/**/*', "*.md", "Rakefile", "LICENSE"] & `git ls-files -z`.split("\0")
  s.test_files = `git ls-files -z -- test`.split("\0")

  s.add_runtime_dependency('gobject-introspection', ["~> 2.2.4"])
  s.add_development_dependency('minitest', ["~> 5.0"])
  s.add_development_dependency('rr', ["~> 1.1"])
  s.add_development_dependency('rake', ["~> 10.1"])

  s.require_paths = ["lib"]
end
