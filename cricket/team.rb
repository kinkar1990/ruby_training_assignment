class Team
    attr_accessor :team_name, :tot_player, :run_rates, :required_rates, :players, :tot_runs, :tot_player_out
    def initialize(team_name, tot_player, run_rates, required_rates, players, tot_runs, tot_player_out)
        @team_name = team_name
        @tot_player = tot_player
        @run_rates = run_rates
        @required_rates = required_rates
        @players = players
        @tot_runs = tot_runs
        @tot_player_out = tot_player_out
    end
    def select_captain(captain)
        if(@players.has_key?(captain))
            @players[captain]['captain'] = true
        end
    end
end