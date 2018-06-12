require "test_helper"

class Rspec::TapFormatterTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rspec::TapFormatter::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
