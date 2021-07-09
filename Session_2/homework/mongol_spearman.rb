require_relative 'villain'

class MongolSpearman < Villain
    def attack(other_player)
        puts "#{@name} slashes #{@other_player.name} with #{@attack_damage} damage"
        other_player.take_damage(@attack_damage)
    end
end