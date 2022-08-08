class Match
    attr_accessor :type, :tot_player, :toss, :overs, :days, :run_wicket, :one_over
    def initialize(type, toss, overs, days, run_wicket, one_over)
        @type = type
        @tot_player = tot_player
        @toss = toss
        @overs = overs
        @days = days
        @run_wicket = run_wicket
        @one_over = one_over
    end
    def set_over_days
        @run_wicket = {
            1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6 , 7 => "Wide", 8 => "byes", 9 => "leg byes",
            10 => "caught behind", 11 => "runout", 12 => "catch out", 13 => "bold", 14 => "stumping",
            15 => "lbw"
        }
        case @type
        when "t20"
            @overs = 1
            @days = 0
        when "odi"
            @overs = 5
            @days = 0
        else
            @overs = 10
            @days = 5
        end
    end
    def print_match_type_details
        puts "Match Type - #{@type} | Total Overs - #{@overs}"
    end
    def select_toss
        @toss = true
    end
end



