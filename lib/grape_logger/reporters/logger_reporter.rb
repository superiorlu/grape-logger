module Reporters
  # :nodoc:
  class LoggerReporter
    def initialize(logger, formatter)
      @logger = logger || Logger.new(STDOUT)
      @logger.formatter = formatter || GrapeLogger::Formatters::Default.new if @logger.respond_to?(:formatter=)
    end

    def perform(params)
      @logger.info params
    end
  end
end
