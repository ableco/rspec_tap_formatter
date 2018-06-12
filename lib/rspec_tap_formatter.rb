require "rspec/core"
require "rspec/core/formatters/base_formatter"

class RspecTapFormatter < RSpec::Core::Formatters::BaseFormatter
  VERSION = "0.1.0"
  # Specification found: https://testanything.org/tap-version-13-specification.html
  #
  # This registers the notifications this formatter supports, and tells
  # us that this was written against the RSpec 3.x formatter API.
  RSpec::Core::Formatters.register self, :start, :example_started, :example_passed, :example_failed

  def initialize(output)
    @output = output
    @count = 0
  end

  def start(notification)
    @output << "TAP version 13\n"
    @output << "#{notification.class}"
  end

  def example_started(notification)
    @count += 1
  end

  def example_passed(example_notification)
    @output << "ok #{@count}\n"
  end

  def example_failed(failed_example_notification)
    @output << "not ok #{@count}\n"
  end
end
