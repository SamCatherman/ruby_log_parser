require_relative 'parser.rb'

logs = File.read(File.open('logs.txt'))
# each log begins with '<3', split on this character combo to create an array of individual logs
logs.split('<3').each do |log|
  next if log.empty?
#   puts "********************************************************"
#   puts "log: #{log}"
#   puts "********************************************************"
  parsed = LogParser.new(log).parse
  puts "parsed: #{parsed}"
end

puts "the end!"