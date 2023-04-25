require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josiane")

puts "Voici l'état de chaque joueur au début du combat :"
print player1.show_state
print player2.show_state
print "\n"

while player1.life_points > 0 && player2.life_points > 0
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  player2.attacks(player1)
  print "\n"
  puts "Voici l'état de chaque joueur aprés cette attaque :"
  print player1.show_state
  print player2.show_state
  print "\n"
end