require 'dcell'
require 'logger'

DCell.start id: 'remote_logger', addr: 'tcp://127.0.0.1:9801'

class RemoteLogger
  include Celluloid

  def initalize
    puts "Ready to log!"
  end

  def logger
    @logger ||= ::Logger.new(STDOUT)
  end

  def log message
    logger.info(message)
  end
end


RemoteLogger.supervise_as :remote_logger
sleep