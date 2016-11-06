require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every  '10s' do
  puts 'Thomas told me to do this every 10s'
end