RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.warnings = true

  config.default_formatter = "doc"

  config.order = :defined
end

class Object
  def _placeholder
    NullObject.new
  end

  def __(other)
    false
  end
end

class PlaceholderError < StandardError; end

# This is the "Black Hole" null object
# From Avdi Grimm's book "Much Ado Abought Naught"
# https://github.com/avdi/naught
class NullObject < BasicObject
  def method_missing(*)
    self
  end

  def respond_to?(*)
    true
  end
  def inspect
    "<null>"
  end
  klass = self
  define_method(:class) { klass }
end
