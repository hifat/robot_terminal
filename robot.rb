class Robot
    def initialize
        @bettery = 10
    end

    def bettery
        bett = @bettery
        
        puts "\n\n"
        print "POWER: "
        
        (1..bett).each do |i|
            print "[]"
            sleep(0.03)
        end
        puts "\nPower is balance: #{@bettery}"
        puts "\n\n"
    end

    def press_key
        require 'io/console' 

        puts "\n\nPress any key is text....\n\n"
        STDIN.getch
    end
    
    def sayhi
        print "\nWhat is your name?"
        print "\nMy name is: "
        
        name = gets.chomp
        
        puts "\nHi #{name}"
        puts "I'm a robot :D"
        
        @bettery -= 0.5

        self.press_key
    end

    def meter
        meter = 0
        far = @bettery / 0.05
        
        loop do
            if @bettery < 1
                puts "Power out !!!"
                meter = 0
                break
            end

            print "\nHow many meters: "
            meter = gets.chomp.to_f

            if meter > 0
                if meter / 20 <= @bettery 
                    @bettery -= (meter / 20)
                    far = @bettery / 0.05
                    puts "Move as far as possible: #{far} m."
                    self.bettery

                    break
                else
                    puts "Not enough power with distance!"
                    puts "Move as far as possible: #{far} m."
                    self.bettery

                    meter = 0
                end
            else
                puts "Robot can't move!"
            end
        end

        return meter
    end

    def forward
        meter = self.meter
        puts "Robot go forward #{meter} m.\n\n"
        self.press_key
    end
    
    def left
        meter = self.meter
        puts "Robot go Left #{meter} m.\n\n"
        self.press_key
    end
    
    def right
        meter = self.meter
        puts "Robot go Right #{meter} m.\n\n"
        self.press_key
    end

    def back
        meter = self.meter
        puts "Robot go back #{meter} m.\n\n"
        self.press_key
    end
    
    def move
        system "cls"
        
        loop do
            puts "[8] Forward"
            puts "[4] Left"
            puts "[6] Right"
            puts "[2] Back"
            puts "[0] Stop!"

            print "Choose an order: "
            ctr = gets.chomp.to_i

            if ctr == 8 || ctr == 4 || ctr == 6 || ctr == 2 || ctr == 0
                case ctr
                when 8
                    self.forward
                when 4
                    self.left
                when 6
                    self.right
                when 2
                    self.back
                when 0
                    break
                end

                system "cls"
            else
                puts "Can't choose try again!"
            end
        end
    end

    def beam
        print "\n  /|\n"
        print " /|\n"
        print "◙◙◙◙ \n"
        (1..30).each do |i|
            print "◘"
            sleep(0.03)
        end
        print "\n◙◙◙◙"
        print "\n \\|"
        print "\n  \\| \n"
        
        @bettery -= 1

        self.press_key
    end
end