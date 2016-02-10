require 'sqlite3'

db = SQLite3::Database.new "BarberShop"

i=0

while i < 4 do

	puts "1name, 2phone, 3datestamp, 4barber, 5color"

	a1 = rand(0000..1111)
	a2 = rand(0000000..9999999)
	a3 = "#{rand(0..31)} #{rand(0..12)} 2016 #{rand(0..24)}-#{rand(0..59)}"
	a4 = rand(0000..2222)
	a5 = rand(0..100)

 	i = i + 1


	db.execute "INSERT INTO Users (Name,Phone, DateStamp, Bareber, Color) VALUES(#{a1},#{a2},#{a3},#{a4},#{a5})"

end












db.execute "SELECT * FROM Users" do |car|
	puts car
	puts "==="
end

db.close