# encoding: utf-8
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

HamburgOnRuby::Application.load_tasks

task :travis_ci=>['db:migrate', 'spec'] do
  puts "*" * 50
  puts "i love travis-ci "
  puts "*" * 50
end