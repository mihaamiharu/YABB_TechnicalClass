require_relative 'hero'
require_relative 'mongol_soldier'
require_relative 'person'
require_relative 'villain'


jin = Hero.new("Jin Sakai", 100, 50, true)
yuna = Hero.new("Yuna", 90, 45, false)
ishikawa = Hero.new("Sensei Ishikawa", 80, 60, false)


mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordman.new("Mongol Swordman", 100, 50)

allies = [jin, yuna, ishikawa]
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
        villain.attack(allies[rand(allies.size)])
        allies.each do |ally|
            allies.delete(ally) if ally.die?
        end
    end
    puts "\n"

    i += 1

end


