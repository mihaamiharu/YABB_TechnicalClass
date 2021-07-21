require_relative 'hero'
class PlayableCharacter < Hero
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @actions = ["heal", "attack"]
    end

    def play_turn(heroes, villains)
        action = select_action
        if action == "heal"
            target = select_target(action, heroes)
            heal(target)
        elsif action == "attack"
            target = select_target(action, villains)
            attack(target)
            villains.delete(target) if (target.die? || target.flee?)
        # else 
        #     puts "Please Pick proper Action"
        #     play_turn(heroes,villains)
        end
    end

    def select_action
        puts "Which action do you want to do?"
        puts "1. Heal an ally"
        puts "2. Attack an enemy"

        select_action_index = gets.chomp.to_i - 1
        puts "\n"

        @actions[select_action_index]
    end

    def select_target(action, targets)
        puts "Which character do you want to #{action} ?"
        targets.each_with_index do |target, index|
            puts "[#{index + 1}] #{target}"
        end
        selected_target_index = gets.chomp.to_i - 1
        puts "\n"

        selected_target = targets[selected_target_index]
    end
end