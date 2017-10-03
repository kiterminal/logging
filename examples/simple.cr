require "logging"

logger = Logging::Logger.new

logger.debug("Debug message doesn't show in log file")
logger.info("Info message will be in log file")
