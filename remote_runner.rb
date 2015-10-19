require 'dcell'

DCell.start id: 'remote_runner', addr: 'tcp://127.0.0.1:9802'

class RemoteRunner
  include Celluloid

  attr_reader :count

  def initalize
    @count = 0
    puts "Ready to run!"
  end

  def logger
    DCell::Node["remote_logger"][:remote_logger]
  end

  def run max_count
    @count = 0
    logger.log("starting new run: #{max_count}")
    puts "running..."
    max_count.times do
      @count += 1
      logger.log("#{max_count - @count} left")
      sleep 1
    end
    logger.log("run finished: #{max_count}")
    puts "done!"
  end
end


RemoteRunner.supervise_as :remote_runner
sleep