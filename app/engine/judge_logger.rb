class JudgeLogger
  def self.set_logger(logger)
    @@logger = logger
  end

  def self.logger
    @@logger
  end

end
