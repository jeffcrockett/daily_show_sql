# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require 'sqlite3'
require 'csv'
require 'pry'

db = SQLite3::Database.new ":memory:"

#Create a database 
rows = db.execute <<-SQL
create table dailyshow (
    season text,
    profession text,
    airdate text,
    category text,
    name text
);
SQL

parsed_file = CSV.read("../daily_show_guests.csv")

parsed_file.each do |line|
    db.execute("insert into dailyshow values (?, ?, ?, ?, ?)", line[0], line[1], line[2], line[3], line[4])
end

db.execute("select * from dailyshow")
binding.pry