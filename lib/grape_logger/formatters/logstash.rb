module GrapeLogger
  module Formatters
    # format for logstash
    class Logstash < Base
      def call(severity, datetime, _, data)
        {
          :'@request_id' => Thread.current[:request_id],
          :'@timestamp' => datetime.iso8601,
          :'@version' => '1',
          :severity => severity
        }.merge!(format_msg(data)).to_json
      end

      private

      def format_msg(data)
        if data.is_a?(Hash)
          data
        elsif data.is_a?(String)
          { message: data }
        elsif data.is_a?(Exception)
          format_exception(data)
        else
          { message: data.inspect }
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
