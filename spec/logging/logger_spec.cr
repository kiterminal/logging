require "file_utils"
require "../spec_helper"

describe Logging::Logger do
  log_file = "output.log"

  Spec.after_each do
    FileUtils.rm(log_file) if File.exists?(log_file)
  end

  describe "#initialize" do
    it "can initialize an instance" do
      logger = Logging::Logger.new

      logger.level.should eq(Logging::Logger::Severity::INFO)
      logger.log_path.should eq("output.log")
    end
  end

  describe "#info" do
    it "log level to info" do
      logger = Logging::Logger.new

      logger.debug "this message from debug method"
      logger.info "this message from info method"

      File.exists?(log_file).should eq(true)
      File.read_lines(log_file).first.includes?("INFO").should eq(true)
    end
  end

  describe "#off" do
    it "set log level to off" do
      logger = Logging::Logger.new
      logger.level = Logging::Logger::Severity::OFF

      logger.debug "this message from debug method"

      File.exists?(log_file).should eq(false)
    end
  end
end
