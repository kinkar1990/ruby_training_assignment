class Player
    attr_accessor :player_type, :player_name, :tot_run, :tot_wicket, :strike_rate, :bowling_economy, :captain, :out, :out_type
    def initialize(player_type, player_name, tot_run, tot_wicket, strike_rate, bowling_economy, captain, out, out_type)
        @player_type = player_type
        @player_name = player_name
        @tot_run = tot_run
        @tot_wicket = tot_wicket
        @strike_rate = strike_rate
        @bowling_economy = bowling_economy
        @captain = captain
        @out = out
        @out_type = out_type
    end
    def player_type_conversion(player_type)
        player_type == 1 ? "Batsman" : player_type == 2 ? "Bowler" : "Allrounder"
    end
    def check_run_or_out(match)
        r = Random.new
        @check_run = r.rand(1...15)
        puts  @check_run
        case @check_run
        when 10..15
            @out = true
            @out_type = match.run_wicket[@check_run]
        when 7..9
            @tot_run = @tot_run + 1
        else
            @tot_run = @tot_run + @check_run
        end
    end
end