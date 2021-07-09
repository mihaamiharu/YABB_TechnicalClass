require_relative 'villain'

class MongolArcher < Villain
    def attack(other_player)
        puts "#{@name} shoots an arrow at #{@other_player.name} with #{@attack_damage} damage"
        other_player.take_damage(@attack_damage)
    end
end

class MongolSpearman < Villain
    def attack(other_player)
        puts "#{@name} slashes #{@other_player.name} with #{@attack_damage} damage"
        other_player.take_damage(@attack_damage)
    end
end

class MongolSwordman < Villain
    def attack(other_player)
        puts "#{@name} slashes #{@other_player.name} with #{@attack_damage} damage"
        other_player.take_damage(@attack_damage)
    end
end


