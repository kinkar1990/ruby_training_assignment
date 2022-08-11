class Team
    TotPlayer = 5
    attr_accessor :team_name, :run_rate, :required_rate, :players, :tot_run_scored, :tot_run_given
    def initialize(team_name, run_rates, required_rate, players, tot_run_scored, tot_run_given)
        @team_name = team_name
        @run_rate = run_rate
        @required_rate = required_rate
        @players = players
        @tot_run_scored = tot_run_scored
        @tot_run_given = tot_run_given
    end
    def select_captain()
        loop do 
            puts "Enter the captain name"
            captain = gets.chomp
            if @players.has_key?(captain)
                @players[captain].captain = true
                return true
            else
                puts "Please enter correct captain name"
            end
        end
        if(@players.has_key?(captain))
            @players[captain].captain = true
        end
    end
    def check_player_exist_batting()
        loop do 
            puts "Enter the player name for batting"
            batting_player = gets.chomp
            if @players.has_key?(batting_player) && @players[batting_player].out === true
                puts "Already out. enter another player"
            elsif @players.has_key?(batting_player)
                return batting_player
            else 
                puts "Please enter correct player name"
            end
        end
    end
    def check_player_exist_bowling()
        loop do 
            puts "Enter the player name for bowling"
            batting_player = gets.chomp
            if @players.has_key?(batting_player)
                return batting_player
            else 
                puts "Please enter correct player name"
            end
        end
    end
    def calculate_required_rate(match, type)
        if type == 'batting'
            @required_rate = (@tot_run_scored.to_f/match.overs).round(2)
        else
            @required_rate = (@tot_run_given.to_f/match.overs).round(2)
        end
    end
    def check_player_type()
        loop do 
            puts "Enter player type =  batsman - press 1/bowler - press 2/allrounder - press 3"
            player_type = gets.chomp.to_i
            if player_type != 1 && player_type != 2 && player_type != 3
                puts "Please enter correct player type"
            else
                return player_type
            end
        end
    end
    def check_player_name()
        loop do 
            puts "Enter player name"
            player_name = gets.chomp
            if player_name == ""
                puts "Please enter player name"
            elsif !@players.empty? && @players.has_key?(player_name)
                puts "player already exists." 
            else
                return player_name
            end
        end
    end
end