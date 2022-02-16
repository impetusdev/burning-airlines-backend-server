print "creating Planes..."
Plane.destroy_all
p1 = Plane.create! name: "Tiger", rows: 5, cols: 8
p2 = Plane.create! name: "Lion", rows: 5, cols: 8

puts "created #{Plane.count} planes"
###########################################
print "creating flights..."
Flight.destroy_all
f1 = Flight.create! number: "QX100", origin: "Sydney", destination: "Auckland", date: "2022/03/15"
f2 = Flight.create! number: "QX110", origin: "Sydney", destination: "Singapore", date: "2022/03/16"
# f3 = Flight.create! number: "QX120", origin: "Singapore", destination: "Auckland", date: "2022/03/17"
# f4 = Flight.create! number: "QX130", origin: "Auckland", destination: "Sydney", date: "2022/03/18"

puts "created #{Flight.count} flights"
###########################################
print "creating Users..."
User.destroy_all
u1 = User.create! name: "Alex", password: "chicken"
u2 = User.create! name: "Lawrence", password: "chicken"
# u3 = User.create! name: "Stanley", password: "chicken"
# u4 = User.create! name: "Suraj", password: "chicken"

puts "created #{User.count} users"
###########################################
print "creating Reservations..."
Reservation.destroy_all
r1 = Reservation.create! seat: "A5"
r2 = Reservation.create! seat: "D5"
# r3 = Reservation.create! seat: "A5"
# r4 = Reservation.create! seat: "B5"
# r5 = Reservation.create! seat: "C5" # this is not seeded correctly. 

puts "created #{Reservation.count} reservations"
###########################################

p1.flights << f1 # << f4
p2.flights << f2 # << f3
puts "plane '#{p1.name}' has flights: #{p1.flights.pluck(:number).join(", ")} "
puts "flight '#{f2.number}' with the plane: '#{f2.plane.name}'"
f1.reservations << r1 # << r3 
f2.reservations << r2
# f3.reservations << r4
# f4.reservations << r5

u1.reservations << r1 # << r3
u2.reservations << r2
# u3.reservations << r4
# u4.reservations << r5
