require 'dcell'

DCell.start :id => 'run', :addr => 'tcp://127.0.0.1:9003'
runner = DCell::Node['remote_runner']

puts 'starting...'
runner[:remote_runner].run(12)
sleep 1
puts 'exit'
