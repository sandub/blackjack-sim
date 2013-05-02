#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'rake/testtask'
require File.expand_path('../config/application', __FILE__)

BlackjackSim::Application.load_tasks

task :default => [:test]

task :test, [:item] do |tst, args|
  if args.item.nil?
    Rake::TestTask.new do |t|
      t.pattern = 'spec/**/*_spec.rb'
    end
  else
    ruby "spec/**/#{args.item}_spec.rb"
  end
end