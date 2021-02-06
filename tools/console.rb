require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

cult1 = Cult.new("Mandalors", "Mandalor", 4500, "This is the way.", 10)
cult2 = Cult.new("Jedi", "Coruscant", 3400, "May the force be with you.", 20)
cult3 = Cult.new("Sith", "Exegol", 4500, "Through strength, I gain power.", 30)
cult4 = Cult.new("Mini-Sith", "Exegol", 4500, "Through strength, I gain power.", 40)

skywalker = Followers.new("Luke Skywalker", 27, "I will teach you the ways of the Jedi.")
maul = Followers.new("Darth Maul", 35, "Yes, Master.")
vader = Followers.new("Darth Vadar", 52, "You have disappointed me for the last time.")
fett = Followers.new("Boba Fett", 62, "I've got a target lock.")
child = Followers.new("Baby Yoda", 27, "Bwah.")
jinn = Followers.new("Qui-Gon Jinn", 27, "Patience.")
tano  = Followers.new("Asoka Tano", 27, "Master!")

oath1 = BloodOaths.new("_3400-11-20_", cult2, skywalker)
oath2 = BloodOaths.new("_3420-08-08_", cult3, maul)
oath3 = BloodOaths.new("_3450-07-05_", cult3, vader)
oath4 = BloodOaths.new("_3427-09-22_", cult1, fett)
oath5 = BloodOaths.new("_3450-01-10_", cult1, child)
oath6 = BloodOaths.new("_3395-12-15_", cult2, jinn)
oath7 = BloodOaths.new("_3456-01-26_", cult2, tano)
oath8 = BloodOaths.new("_3456-01-26_", cult3, skywalker)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits