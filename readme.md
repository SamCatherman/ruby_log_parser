***Ruby Log Parser***
This program includes a sample file of logs from a network firewall. Running the program will parse each log and print a hash to the terminal with data about the IP addresses involved in each log. The program was built with Ruby v. 2.6.5.

**To Run**
- open a new terminal window
- using your preferred ruby version manager, make sure you are using Ruby 2.6.5 or later.
- clone this repository, `git clone git@github.com:SamCatherman/ruby_log_parser.git`
- navigate into the directory, `cd ruby_log_parser`
- run, `ruby main.rb`

There are no external dependencies - each IP address is extracted from the log text and initialized as an IPAddr object. (https://ruby-doc.org/stdlib-2.6.5/libdoc/ipaddr/rdoc/IPAddr.html)
