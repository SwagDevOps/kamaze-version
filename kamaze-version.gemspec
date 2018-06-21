# frozen_string_literal: true
# vim: ai ts=2 sts=2 et sw=2 ft=ruby
# rubocop:disable all

Gem::Specification.new do |s|
  s.name        = "kamaze-version"
  s.version     = "1.0.0"
  s.date        = "2018-06-21"
  s.summary     = "Provide version as an object"
  s.description = "Why use a simple String, when you can use an Object?"

  s.licenses    = ["GPL-3.0"]
  s.authors     = ["Dimitri Arrigoni"]
  s.email       = "dimitri@arrigoni.me"
  s.homepage    = "https://github.com/SwagDevOps/kamaze-version"

  # MUST follow the higher required_ruby_version
  # requires version >= 2.3.0 due to safe navigation operator &
  s.required_ruby_version = ">= 2.3.0"
  s.require_paths = ["lib"]
  s.files = [
    ".yardopts",
    "lib/kamaze-version.rb",
    "lib/kamaze/version.rb",
    "lib/kamaze/version/version.rb",
    "lib/kamaze/version/version.yml",
  ]

  s.add_runtime_dependency("dry-inflector", ["~> 0.1"])
end

# Local Variables:
# mode: ruby
# End:
