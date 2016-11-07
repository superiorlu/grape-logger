module GrapeLogger
  module Formatters
    # :nodoc:
    class Base
      def call(severity, datetime, _, msg)
      end

      def format_msg(message)
      end

      def format_exception(exception)
      end
    end
  end
end
