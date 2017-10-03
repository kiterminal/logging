module Logging
  class Logger
    property level : Severity
    property log_path : String

    # A logger severity level
    enum Severity
      # No information will be logged
      OFF

      # An unhandleable error that results in a program crash
      FATAL

      # A handleable error condition
      ERROR

      # A warning
      WARN

      # Generic information about system operation
      INFO

      # Low-level information for developers
      DEBUG
    end

    def initialize(log_path = "output.log")
      @level = Severity::INFO
      @log_path = log_path
    end

    {% for severity in Severity.constants %}
      {{severity.id}} = Severity::{{severity.id}}

      def {{severity.id.downcase}}(message)
        return if level < Severity::{{severity.id}}
        write(Severity::{{severity.id}}.to_s, message)
      end
    {% end %}

    private def write(severity, message)
      File.open(@log_path, "a+") do |file|
        file.write("[#{Time.now} ##{Process.pid}] #{severity.rjust(5)}: #{message}\n".to_slice)
      end
    end
  end
end
