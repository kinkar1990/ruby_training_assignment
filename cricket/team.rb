class Team
    attr_accessor :team_name, :tot_player, :run_rate, :required_rate, :players, :tot_run_scored, :tot_run_given
    def initialize(team_name, tot_player, run_rates, required_rate, players, tot_run_scored, tot_run_given)
        @team_name = team_name
        @tot_player = tot_player
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
    def calculate_required_rate(match)
        @required_rate = (@tot_run_scored.to_f/match.overs).round(2)
    end
end