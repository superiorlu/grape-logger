module GrapeLogger
  module Formatters
    # format for json
    class Json < Base
      def call(severity, datetime, _, data)
        {
          request_id: Thread.current[:request_id],
          date: datetime,
          severity: severity,
          data: format_msg(data)
        }.to_json
      end

      private

      def format_msg(data)
        if data.is_a?(String) || data.is_a?(Hash)
          data
        elsif data.is_a?(Exception)
          format_exception(data)
        else
          data.inspect
        end
      end

      def format_exception(exception)
        {
          exception: {
            message: exception.message
          }
        }
      end
    end
  end
end
