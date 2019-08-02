require "bundler/gem_tasks"
task :default => :test

desc "Run tests"
task :test do
  options = ARGV[1..-1]
  exit_status = ruby("test/run-test.rb", *options)
end
