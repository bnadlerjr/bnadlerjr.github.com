# frozen_string_literal: true

require 'html-proofer'

task :test do
  sh 'bundle exec middleman build'
  options = { assume_extension: true }
  HTMLProofer.check_directory('./build', options).run
end
