class Player
    attr_accessor :player_type, :player_name, :run_scored, :wicket_taken, :strike_rate, :bowling_economy, :captain, :out, :out_type, :ball_played, :ball_bowled, :run_given, :bowler_wicket_no
    def initialize(player_type, player_name, run_scored, wicket_taken, strike_rate, bowling_economy, captain, out, out_type, ball_played, ball_bowled, run_given, bowler_wicket_no)
        @player_type = player_type
        @player_name = player_name
        @run_scored = run_scored
        @wicket_taken = wicket_taken
        @strike_rate = strike_rate
        @bowling_economy = bowling_economy
        @captain = captain
        @out = out
        @out_type = out_type
        @ball_played = ball_played
        @ball_bowled = ball_bowled
        @run_given = run_given
        @bowler_wicket_no = bowler_wicket_no
    end
    def player_type_conversion(player_type)
        player_type == 1 ? "Batsman" : player_type == 2 ? "Bowler" : "Allrounder"
    end
    def check_run_or_out_batting(match)
        r = Random.new
        @check_run = r.rand(1...14)
        case @check_run
        when 9..14
            @out = true
            @out_type = match.class::RunWicket[@check_run]
            unit_run_batting = 0
        when 7..8
            @run_scored = @run_scored + 1
            unit_run_batting = 1
        when 5
            @run_scored = @run_scored + 1
            unit_run_batting = 1
        else
            @run_scored = @run_scored + @check_run
            @unit_run_batting = @check_run
            unit_run_batting = @check_run
        end
        @ball_played = @ball_played + 1
        @strike_rate = ((@run_scored.to_f/@ball_played.to_f)*100).round(2)
        return unit_run_batting
    end
    def check_run_or_out_bowling(match)
        r = Random.new
        @check_run = r.rand(1...14)
        case @check_run
        when 9..14
            @wicket_taken = true
            @bowler_wicket_no = @bowler_wicket_no + 1
            unit_run_bowling = 0
        when 7..8
            @run_given = @run_given + 1
            unit_run_bowling = 1
        when 5
            @run_given = @run_given + 1
            unit_run_bowling = 1
        else
            @run_given = @run_given + @check_run
            unit_run_bowling = @check_run
        end
        @ball_bowled = @ball_bowled + 1
        if @run_given > 0 && @ball_bowled > 0 && @ball_bowled < match.class::OneOver
            @bowling_economy = (@run_given/@ball_bowled).round(2)
        else
            @bowling_economy = (@run_given/(@ball_bowled.to_f/match.class::OneOver)).round(2)
        end
        return unit_run_bowling
    end
end