require_relative 'game'
require_relative 'hero'
require_relative 'mongol_archer'
require_relative 'mongol_spearman'
require_relative 'mongol_swordsman'
require_relative 'playable'

jin = PlayableCharacter.new("Jin Sakai", 100, 50)
yuna = Hero.new("Yuna", 90, 45)
ishikawa = Hero.new("Sensei Ishikawa", 80, 60)
mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)

game = Game.new(jin)
game.add_hero(yuna)
game.add_hero(ishikawa)
game.add_villain(mongol_archer)
game.add_villain(mongol_spearman)
game.add_villain(mongol_swordsman)
game.start