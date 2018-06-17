# frozen_string_literal: true

require_relative '../lib/kamaze-version'

[
  :constants,
  :configure,
].each do |req|
  require_relative '%<dir>s/%<req>s' % {
    dir: __FILE__.gsub(/\.rb$/, ''),
    req: req.to_s,
  }
end
