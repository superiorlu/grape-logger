module GrapeLogger
  module Formatters
    # format default
    class Default < Base
      def call(severity, datetime, _, msg)
        "[#{Thread.current[:request_id]} #{datetime.strftime('%Y-%m-%d %H:%M:%S.%L')}] #{severity} #{format_msg(msg)}\n"
      end

      def format_msg(message)
        if message.is_a?(String)
          message
        elsif message.is_a?(Exception)
          format_exception(message)
        elsif message.is_a?(Hash)
          format_hash(message)
        else
          message.inspect
        end
      end

      private

      def format_hash(hash)
        [].tap do |msg|
          msg << 'Completed'
          msg << hash.delete(:status)
          msg << 'in'
          msg << "#{hash[:time].delete(:total)}ms"
          msg << "[DB:#{hash[:time].delete(:db)}ms View:#{hash[:time].delete(:view)}ms]"
        end.join(' ')
      end

      def format_exception(exception)
        backtrace_array = (exception.backtrace || []).map { |line| "\t#{line}" }
        "#{exception.message}\n#{backtrace_array.join("\n")}"
      end
    end
  end
end
