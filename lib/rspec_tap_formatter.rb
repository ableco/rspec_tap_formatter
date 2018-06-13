require "rspec/core"
require "rspec/core/formatters/base_formatter"

class RspecTapFormatter < RSpec::Core::Formatters::BaseFormatter
  VERSION = "0.5.0"
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
    @output << "1..#{notification.count}\n"
  end

  def example_started(notification)
    @count += 1
  end

  def example_passed(notification)
    @output << "ok #{@count} #{notification.example.description}\n"
  end

  def example_failed(notification)
    @output << "not ok #{@count} #{notification.example.description}\n"
    @output << "# #{failed_example_notification.message_lines.join('\n# ')}\n"
  end
end
