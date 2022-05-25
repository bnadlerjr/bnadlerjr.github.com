---
id: 6bc358a9-90e9-412d-aa75-23a85a016bd8
title: Workflow for Using Ruby Bumpversion
date: 2019-01-03
description: "An example script illustrating the usage of the Ruby bumpversion gem."
image: "subsequently.jpg"
alt: "Subsequently"
source: "Thomas Hawk"
url: "https://flic.kr/p/4xKkzk"
---
A few years ago while working on a Python project for a client, I came across a tool called [bumpversion](https://github.com/c4urself/bump2version). It was written in Python and was used to modify the version of a package before publishing. It used [semver](https://semver.org/) language, so the command `bumpversion minor` would increment the minor portion of the version. It could also optionally handle making a Git tag, committing, etc. I recently found out there's an [equivalent tool in Ruby](https://github.com/dlanileonardo/bumpversion). Since I'm mostly writing Ruby these days, I decided to try it out.

## Configuration
The main configuration point is the `.bumpversion.cfg` file, which is placed in your project's root folder. It supports several options and looks something like this:

```
[bumpversion]
current-version=1.3.7
git-commit=yes
git-tag=yes
git-push=yes
```

More options [are available](https://github.com/dlanileonardo/bumpversion#options).

## Usage
I currently use it for tagging new releases of internal gems with a script that looks like this:

``` ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

APP_ROOT = File.expand_path('..', __dir__)

def fail!(msg)
  abort("\n#{msg}\nUSAGE: ./bin/release major|minor|patch")
end

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end

FileUtils.chdir APP_ROOT do
  puts '== Running Bumpversion =='
  branch = `git rev-parse --abbrev-ref HEAD`.chomp
  unless 'main' == branch
    fail!(
      'Error: Can only perform a release from the main branch; ' \
      "current branch is '#{branch}'"
    )
  end

  fail!('Error: Version part argument is missing') if ARGV.length.zero? || ARGV.length > 1

  part = ARGV[0]
  unless %w[major minor patch].include?(part)
    fail!("Error: '#{part}' is not a valid version part")
  end

  system!("bundle exec bumpversion --part #{part}")
end
```

The script assumes that the `bumpversion` gem is installed locally or via a `Gemfile`.
