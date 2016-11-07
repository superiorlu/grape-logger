module Reporters
  # :nodoc:
  class ActiveSupportReporter
    def initialize(instrumentation_key)
      @instrumentation_key = instrumentation_key
    end

    def perform(params)
      ActiveSupport::Notifications.instrument @instrumentation_key, params
    end

    alias info perform
    alias warn perform
    alias error perform
  end
end
