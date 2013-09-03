require "bundler/gem_tasks"

task :test do
  require "bundler"
  Bundler.setup
  Bundler.require
  require "minitest/pride"
  require "minitest/autorun"
  require "./spec/ip_country_spec"  
end

task :default => :test