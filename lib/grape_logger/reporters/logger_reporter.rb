module Reporters
  # :nodoc:
  class LoggerReporter
    extend Forwardable
    def_instance_delegators :@logger, :info, :error, :warn

    def initialize(logger, formatter)
      @logger = logger || Logger.new(STDOUT)
      @logger.formatter = formatter || GrapeLogger::Formatters::Default.new if @logger.respond_to?(:formatter=)
    end

    alias perform info
  end
end
