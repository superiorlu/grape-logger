module GrapeLogger
  module Formatters
    # format default
    class Default < Base
      def call(severity, datetime, _, msg)
        "[#{severity.object_id} #{datetime.strftime('%Y-%m-%d %H:%M:%S.%L')}] #{severity} #{format(msg)}\n"
      end

      def format(message)
        if message.is_a?(String)
          message
        elsif message.is_a?(Exception)
          format_exception(message)
        elsif message.is_a?(Hash)
          "#{message.delete(:status)} [#{format_hash(message.delete(:time))}] #{message.delete(:method)} #{message.delete(:path)} #{message[:params]}"
        else
          message.inspect
        end
      end

      private

      def format_hash(hash)
        [].tap do |times|
          times << "#{hash[:total]}ms"
          times << "#{hash[:db]}ms"
          times << "#{hash[:view]}ms"
        end.join(' ')
      end

      def format_params(params)
        params
      end

      def format_exception(exception)
        backtrace_array = (exception.backtrace || []).map { |line| "\t#{line}" }
        "#{exception.message}\n#{backtrace_array.join("\n")}"
      end
    end
  end
end
