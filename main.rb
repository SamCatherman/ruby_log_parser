require_relative 'parser.rb'

logs = File.read(File.open('logs.txt'))
# each log begins with '<3', split on this character combo to create an array of individual logs
logs.split('<3').each do |log|
  next if log.empty?
  parsed = LogParser.new(log).parse
  puts "IP data: #{parsed}"
end

puts "the end!"