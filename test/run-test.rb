require "test-unit"
require "test/unit/rr"

base_dir = Pathname.new(__FILE__).dirname.parent.expand_path
lib_dir = base_dir + "lib"
test_dir = base_dir + "test"

Test::Unit::Priority.enable

$LOAD_PATH.unshift(lib_dir.to_s)
$LOAD_PATH.unshift(test_dir.to_s)
require "helper"

Dir.glob("#{base_dir}/test/**/test{_,-}*.rb") do |file|
  require file.sub(/\.rb\z/, '')
end

ENV["TEST_UNIT_MAX_DIFF_TARGET_STRING_SIZE"] ||= "5000"

exit Test::Unit::AutoRunner.run
