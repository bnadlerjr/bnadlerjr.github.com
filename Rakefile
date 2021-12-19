# frozen_string_literal: true

require 'html-proofer'
require 'w3c_validators'

task :test do
  sh 'bundle exec middleman build'
  options = { assume_extension: true, check_favicon: true }
  HTMLProofer.check_directory('./build', options).run
end

task :validate do
  sh 'bundle exec middleman build'
  validator = W3CValidators::NuValidator.new
  puts "\nValidating generated HTML files..."
  Dir.glob('./build/**/*.html').each do |filename|
    results = validator.validate_file(filename)
    if results.errors.length.positive?
      puts "#{filename} is invalid..."
      results.errors.each { |e| puts "    * #{e}" }
    end
  end
end
