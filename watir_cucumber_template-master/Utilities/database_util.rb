require 'rubygems'
require 'dbi'
class DatabaseUtil
dbh = DBI.connect('DBI:Mysl:code_snippet', 'root', 'password')
if dbh
  puts "database connected successfully"
else
  puts "database could not connect"
end
  dbh.disconnect
end