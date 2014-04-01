# Initial users

puts "Creating countries ..."
Country.create([{name: 'South Africa'}])
puts "Creating regions ..."
Region.create([{name: 'Gauteng Region'}])
puts "Creation region to country relationship ..."
region = Region.first
region.country = Country.first
region.save

puts "Creating district ..."
District.create([{name: 'Randburg District'}])
puts "Creation district to region relationship ..."
district = District.first
district.region = Region.first
district.save

puts "Creating burrows ..."
Burrow.create([{name: 'Orange'}])
Burrow.create([{name: 'Purple'}])
Burrow.create([{name: 'Yellow'}])
Burrow.create([{name: 'Red'}])
Burrow.create([{name: 'Blue'}])
Burrow.create([{name: 'Green'}])

puts "Creating sixers ..."
Sixer.create([{name: 'Orange'}])
Sixer.create([{name: 'Purple'}])
Sixer.create([{name: 'Yellow'}])
Sixer.create([{name: 'Red'}])
Sixer.create([{name: 'Blue'}])
Sixer.create([{name: 'Green'}])

puts "Creating patrols ..."
Patrol.create([{name: 'Bat'}])
Patrol.create([{name: 'Cobras'}])
Patrol.create([{name: 'Leopards'}])
Patrol.create([{name: 'Kestrels'}])
Patrol.create([{name: 'Sables'}])

puts "Creating users ..."
User.create([{name: 'Timothy Venn', email:'tim@nevyn.co.za', password: 'xxx123'}])
User.create([{name: 'Sharon Venn', email: 'sharon@nevyn.co.za', password: 'xxx123'}])

puts "Creating parent Timothy Venn ..."
Parent.create([{firstnames: 'Timothy' , surname: 'Venn', email: 'tim@nevyn.co.za', cell: '0829087150', tel_home: '0117917217', address: '19 Korhaan Street, Randpark Ridge, 2164'}])

puts "Linking user Timothy Venn to parent record ..."
user = User.find(1)
user.parent = Parent.find(1)
user.save

puts "Creating committee positions ..."
Committee.create([{name: 'Chairman'}])
Committee.create([{name: 'Treasurer'}])
Committee.create([{name: 'Secretary'}])
Committee.create([{name: 'Marketing / Communications'}])
Committee.create([{name: 'Quartermaster'}])

puts "Creating adult role positions ..."
Adultrole.create([{name: 'Group Scouter'}])
Adultrole.create([{name: 'Troop Scouter'}])
Adultrole.create([{name: 'Pack Scouter'}])
Adultrole.create([{name: 'Assistant Pack Scouter'}])
Adultrole.create([{name: 'Other'}])

puts "Creating parent Sharon Venn ..."
Parent.create([{firstnames: 'Sharon' , surname: 'Venn'}])

puts "Setting user Sharon Venn as Pack Scouter ..."
parent = Parent.find(2)
parent.adultroles << Adultrole.find(3)
parent.save

puts "Creating recruits"
Recruit.create([{recruit_surname: 'Venn' ,recruit_firstnames: 'Caitlyn', recruit_idnumber: '20020917', scout: true, cub: false}])
Recruit.create([{recruit_surname: 'Venn' ,recruit_firstnames: 'Michael', recruit_idnumber: '20070125', cub: true, scout: false}])

puts "Linking recruits to parents ..."
recruit = Recruit.find(1)
recruit.parents << Parent.find(1)
recruit.parents << Parent.find(2)
recruit.save

recruit = Recruit.find(2)
recruit.parents << Parent.find(1)
recruit.parents << Parent.find(2)
recruit.save

parent = Parent.last
parent.family_code = nil
parent.save

puts "Creating default attendance types ..."
Attendancetype.create([{name: 'Cub meeting'}])
Attendancetype.create([{name: 'Scout meeting'}])
Attendancetype.create([{name: 'Meerkat meeting'}])

