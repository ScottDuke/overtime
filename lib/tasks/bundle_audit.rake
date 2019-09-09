# frozen_string_literal: true
unless Rails.env.production?
  require 'bundler/audit/task'
  require 'bundler/audit/cli'

  namespace :bundle_audit do
    desc "Run bundle audit"
    task :run do
      puts "Updating Bundler Audit\n\n"
      Bundler::Audit::CLI.start ['update']

      puts "Running Bundler Audit\n\n"
      Bundler::Audit::CLI.start ['check']
    end
  end
end
