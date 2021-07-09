require_relative 'person'

class Hero  < Person
    attr_reader :controlled_character

    def initialize(name, hitpoint, attack_damage, controlled_character)
        super(name, hitpoint, attack_damage)
        @block_chance = 0.8
        @controlled_character = controlled_character
        @heal_amount = 20
    end

    def take_damage(damage)
        if rand < @block_chance
            puts "#{@name} deflects the attack."
        else 
            @hitpoint -= damage
        end
    end

    def jin_choices(villains, allies)
        puts "As #{name}, what do you want to do this turn?"
        puts "1. Attack an enemy"
        puts "2. Heal an ally"
        jin_choose = gets.to_i
        puts "\n"

        #Do as jin choice
        if jin_choose == 1
            jin_attack(villains)
        elsif jin_choose == 2 
            jin_heal(allies)
        else
            puts "Enter only 1 or 2"
            #If user input not 1 or 2, let user choices again 
            jin_choices(villains, allies)
        end
    end

    def jin_attack(villains)
        puts "Which enemy you want to attack?"
        villains.each_with_index do |villain, index|
            puts "#{index +1}. #{villain.name}"
        end

        jin_choose = gets.to_i
        if jin_choose <= villains.size
            attack(villains[jin_choose - 1])
        else
            puts "Enter only 1, 2 or 3"
            #If user input not 1,2 or 3, let user choices again 
            jin_attack(villains)
        end
    end

    def jin_heal(allies)
        puts "Which ally you want to heal?"
        allies.each_with_index do |allies, index|
            puts "#{index}. #{ally.name}"
        end

        jin_choose = gets.to_i
        if jin_choose <= allies.size 
            heal_ally(allies[jin_choose])
        else
            puts "Enter only 1 or 2"
            #If user input not 1 or 2, let user choices again 
            jin_heal(allies)
        end
    end

    def heal
        @hitpoint += @heal_point
    end

    def heals (other_player)
        puts "#{@name} heals #{@other_player}, restoring #{@heal_point} hitpoints"
        other_player.heal
    end

    
end
