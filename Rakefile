require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/*_test.rb'
end

task :console do
  require 'pry'
  require 'bailiff'
  ARGV.clear
  Pry.start
end
