require_relative 'hero'
require_relative 'mongol_archer'
require_relative 'mongol_spearman'
require_relative 'mongol_swordsman'
require_relative 'person'
require_relative 'villain'



#Add 1 new var for can controlled or not
jin = Hero.new("Jin Sakai", 100, 50, true)
yuna = Hero.new("Yuna", 90, 45, false)
ishikawa = Hero.new("Sensei Ishikawa", 80, 60, false)
allies = [jin, yuna, ishikawa]

mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)
villains = [mongol_archer, mongol_spearman, mongol_swordsman]

i = 1 #Turn Counter
until (jin.die? || villains.empty?) do 
    puts "======== Turn #{i} ========"
    puts "\n"

    allies.each do |ally| 
        puts ally
    end
    puts "\n"
    
    villains.each do |villain|
        puts villain
    end 
    puts "\n"

    allies.each do |ally|
        ally.jin_choices(villains, allies) if ally.controlled_character
    end

    villains.each do |villain|
        villains.delete(villain) if villain.die? || villain.flee?
    end
    

    allies.each do |ally| 
        ally.attack(villains[rand(villains.size)]) if !ally.controlled_character
        villains.each do |villain|
            villains.delete(villain) if villain.die? || villain.flee?
        end
  
    end
    puts "\n"

    villains.each do |villain|
        villain.attack(allies[rand(allies.size)]) if !allies.empty?
        allies.each do |ally|
            if ally.die?
            allies.delete(ally) 
            end
        end
    end
    puts "\n"

    i += 1
end


