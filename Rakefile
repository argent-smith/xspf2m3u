require "rubygems"
require "bundler/setup"
require "bundler/gem_tasks"

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features) do |features|
  features.cucumber_opts = "features --tags ~@wip --format progress"
end
namespace :features do
  Cucumber::Rake::Task.new(:pretty, "Run Cucumber features with output in pretty format") do |features|
    features.cucumber_opts = "features --tags ~@wip --format pretty"
  end
  Cucumber::Rake::Task.new(:wip, "Run @wip (Work In Progress) Cucumber features") do |features|
    features.cucumber_opts = "features --tags @wip --format progress"
  end
end

require 'rspec/core/rake_task'
desc "Run specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w(--color)
end
namespace :spec do
  desc "Run specs with output in documentation format"
  RSpec::Core::RakeTask.new(:doc) do |t|
    t.rspec_opts = ["--color", "--format d"]
  end
end

desc "Default autotest task"
task :autotest => "autotest:spec"

namespace :autotest do
  desc "Start Autotest CI"
  task :spec => [".autotest", ".rspec"] do
    sh "bundle exec autotest"
  end
  desc "autotest + features"
  task :features => "cucumber.yml" do
    sh "(bundle exec env AUTOFEATURE=true autotest)"
  end
end

rdoc_title = "Xspf2m3u: the playlist converter"

require 'rdoc/task'
Rake::RDocTask.new do |rd|
  rd.title = rdoc_title
  rd.main  = "README.rdoc"
  rd.rdoc_files.include %w{README.rdoc LICENSE.rdoc HISTORY.md lib/**/*.rb}
end

desc "Clean up"
task :clean  do
  sh "git clean -fd"
end

task :default => [:spec, :features]
