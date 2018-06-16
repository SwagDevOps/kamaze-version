# frozen_string_literal: true

require_relative 'lib/kamaze-version'
require 'kamaze/version'
require 'sys/proc'

Sys::Proc.progname = nil

Kamaze.project do |project|
  project.subject = Kamaze::Version
  project.name    = 'kamaze-version'
  project.tasks   = [
    'cs:correct', 'cs:control',
    'cs:pre-commit',
    'doc', 'doc:watch',
    'gem',
    'misc:gitignore',
    'shell', 'sources:license',
    'test',
    'vagrant', 'version:edit',
  ]
end.load!

task default: [:gem]

if project.path('spec').directory?
  task :spec do |task, args|
    Rake::Task[:test].invoke(*args.to_a)
  end
end
