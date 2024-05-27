# frozen_string_literal: true

require 'html-proofer'
require 'w3c_validators'

HTML_FILES = './build/**/*.html'

def fail_with_msg(msg)
  puts "\n\e[31m#{msg}\e[0m"
  abort
end

desc 'Build the site'
task :build do
  sh 'bundle exec middleman build'
end

desc 'Preview the site'
task :preview do
  sh 'bundle exec middleman serve'
end

desc 'Deploy the site'
task deploy: %w[build check_spelling validate:feed html_proof] do
  sh 'bundle exec middleman deploy'
end

desc 'Run HTML-Proofer against build directory'
task html_proof: %w[build] do
  options = { assume_extension: true, check_favicon: true, check_https: true, cache: { timeframe: { external: '30d' } } }
  HTMLProofer.check_directory('./build', options).run
end

namespace :validate do
  desc 'Validate HTML files using the W3C Validator'
  task html: %w[build] do
    validator = W3CValidators::NuValidator.new
    all_valid = true
    print "\nValidating HTML files..."
    Dir.glob(HTML_FILES).each do |filename|
      results = validator.validate_file(filename)
      next unless results.errors.length.positive?

      all_valid = false
      puts "\n#{filename} is invalid..."
      results.errors.each { |e| puts "    * #{e}" }
    end
    all_valid ? puts('done!') : fail_with_msg('There were HTML validation errors!')
  end

  desc 'Validate site feed.xml using the W3C Validator'
  task feed: %w[build] do
    validator = W3CValidators::FeedValidator.new
    print "\nValidating feed.xml..."
    results = validator.validate_file('./build/feed.xml')
    if results.errors.length.positive?
      results.errors.each { |e| puts "    * #{e}" }
      fail_with_msg('feed.xml is invalid!')
    else
      puts 'done!'
    end
  end
end

desc 'Check for spelling errors'
task check_spelling: %w[build] do
  all_valid = true
  aspell = [
    'aspell pipe',
    '--add-html-skip=code',
    '--ignore-case',
    '--ignore=3',
    '--lang=en_US',
    '--mode=html',
    '--personal=./.aspell.en.pws'
  ].join(' ')
  print "\nChecking spelling..."
  Dir.glob(HTML_FILES).each do |filename|
    result = `cat #{filename} | #{aspell} | grep "^\\&"`
    next if result.empty?

    all_valid = false
    puts "\n#{filename}"
    puts result
  end

  all_valid ? puts('done!') : fail_with_msg('There were spelling errors!')
end

task default: %w[check_spelling validate:feed html_proof]
