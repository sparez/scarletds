# scarletds rake build script
# Author:: Reza Marvan Spagnolo
# License:: see LICENSE

require 'rake/testtask'
require 'rdoc/task'

# unit tests
Rake::TestTask.new do |t|
  t.pattern = 'test/**/tc_*.rb'
end

# rdoc
Rake::RDocTask.new do |rd|
  rd.rdoc_dir = 'doc/'
  rd.main = 'README'
  rd.rdoc_files.include "lib/**/*\.rb", "test/**/*\.rb"

  rd.options << '--line-numbers'
  rd.options << '--all'
end

task :default => [:test]
