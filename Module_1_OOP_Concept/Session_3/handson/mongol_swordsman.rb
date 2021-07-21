require_relative 'villain'

class MongolSwordsman < Villain
    def attack(other_player)
        puts "#{@name} slashes #{@other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end
end