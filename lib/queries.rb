# Write methods that return SQL queries for each part of the challeng here
require_relative '../config/environment.rb'
require 'pry'
def guest_with_most_appearances
  db.execute("select name, count(name) from dailyshow group by name order by count(name) desc limit 1")[0]
end

def most_frequent_profession 
  db.execute("select profession, count(profession) from dailyshow group by profession order by count(profession) desc limit 1")[0]
end
def all_guests_named_bill 
  db.execute("select distinct name from dailyshow where name like 'Bill%'")[0]
end



binding.pry 

