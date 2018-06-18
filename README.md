# kamaze-version

``Kamaze::Version`` is a lightweight ``gem`` to manage and provide
version data in your Ruby projects or gems.

## Usage

First, include ``Kamaze::Version`` in your main project module (or class):

```
lib/awesome_project.rb
```

```ruby
module AwesomeProject
  autoload :VERSION, "#{__dir__}/awesome_project/version"
end
```

```
lib/awesome_project/version.rb
```

```ruby
require 'kamaze/version'

module AwesomeProject
  VERSION = Kamaze::Version.new.freeze
end
```

Then. add a ``version.yml`` file:

```
lib/awesome_project/version.yml
```


```yaml
---
major: 1
minor: 0
patch: 0
authors: ['Nikola Tesla']
email: 'nikola.tesla.@example.org'
homepage: 'https://teslauniverse.com/'
date: '1913-05-06'
patent: '1,061,206'
summary: 'The Tesla turbine is a bladeless centripetal flow.'
description: 'This turbine is an efficient self-starting prime mover which may be operated as a steam or mixed fluid turbine at will, without changes in construction and is on this account very convenient.'
```

## Runing the tests

```
bundle install --path vendor/bundle --clean
bundle exec rake test
```

## See also

* [VersionInfo - Lightweight & powerful gem to handle your project version info][jcangas/version_info]

[jcangas/version_info]: https://github.com/jcangas/version_info
