


class GuessingGame
    attr_reader :num_attempts

    def initialize(min,max)
    
        @secret_num = rand(0..100)
        @num_attempts = 0
        @game_over = false
    
    end

    def game_over?
        @game_over
    end

    def check_num(n)
        if n == @secret_num
            puts "you win"
            return @game_over = true
            
        elsif n > @secret_num
            @num_attempts += 1
            puts "too big"
            return false
        elsif n < @secret_num
            @num_attempts += 1
            puts "too small"
            return false
        end
    end
    
    def ask_user
        puts "enter a number"
        number = gets.chomp
        int = number.to_i
        check_num(int)
    end


end
