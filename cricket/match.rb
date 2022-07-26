class Match
    RunWicket = {
        1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => "Wide", 6 => 6 , 7 => "byes", 8 => "leg byes",
        9 => "caught behind", 10 => "run out", 11 => "catch out", 12 => "bold", 13 => "stumping",
        14 => "lbw"
    }
    BallToFloat = {
        1 => 0.1, 2 => 0.2, 3 => 0.3, 4 => 0.4, 5 => 0.5, 6 => 0.6
    }
    OneOver = 6
    attr_accessor :type, :toss, :overs
    def initialize(type, toss, overs)
        @type = type
        @toss = toss
        @overs = overs
    end
    def set_over_days
        case @type
        when "t20"
            @overs = 3
        when "odi"
            @overs = 5
        end
    end
    def print_match_type_details
        puts "Match Type - #{@type} | Total Overs - #{@overs}"
    end
    def select_toss
        r = Random.new
        random_sample = r.rand(1...20) 
        if random_sample % 2 == 0
            @toss = true
        else
            @toss = false
        end
    end
    def check_team_name()
        loop do 
            puts "Enter the team name"
            team_name = gets.chomp
            if team_name == ""
                puts "Please enter team name"
            else
                return team_name
            end
        end
    end
    def batting(team)
        i = 1
        tot_player_out = 0
        do_break = false
        batting_player = team.check_player_exist_batting()
        while i <= overs
            j = 1
            while j <= OneOver
                unit_run_batting = team.players[batting_player].check_run_or_out_batting(self)
                team.tot_run_scored = team.tot_run_scored + unit_run_batting
                if(team.tot_run_scored > team.tot_run_given && team.tot_run_scored > 0 && team.tot_run_given > 0)
                    do_break = true
                    break
                end
                if team.players[batting_player].out === true
                    tot_player_out = tot_player_out + 1
                    if tot_player_out == team.class::TotPlayer
                        do_break = true
                        break
                    else
                        batting_player = team.check_player_exist_batting()
                    end
                end
                j = j + 1
            end
            if i == @overs || do_break
                match_summary(team, true, false)
            else
                match_summary(team, false, false)
            end
            break if do_break
            i = i + 1
        end
    end
    def bowling(team)
        i = 1
        tot_player_out = 0
        do_break = false
        while i <= overs
            bowling_player = team.check_player_exist_bowling()
            j = 1
            while j <= OneOver
                unit_run_bowling = team.players[bowling_player].check_run_or_out_bowling(self)
                team.tot_run_given = team.tot_run_given + unit_run_bowling
                if(team.tot_run_scored < team.tot_run_given && team.tot_run_scored > 0 && team.tot_run_given > 0)
                    do_break = true
                    break
                end
                if team.players[bowling_player].wicket_taken === true
                    team.players[bowling_player].wicket_taken = false
                    tot_player_out = tot_player_out + 1
                    if tot_player_out == team.class::TotPlayer
                        do_break = true
                        break
                    end
                end
                j = j + 1
            end
            if i == @overs || do_break
                match_summary(team, false, true)
            else
                match_summary(team, false, false)
            end
            break if do_break
            i = i + 1
        end
    end
    def match_summary(tot_summary, batting_ending, bowling_ending)
        out_file = File.new("match_summary.txt", "w+")
        out_file.puts("Team Name - #{tot_summary.team_name}")
        out_file.puts("--------------------------------------------------")
        out_file.puts("--------------------------------------------------")
        ending = false
        if @toss === true
            batting_summary(out_file, tot_summary)
            if batting_ending === true
                tot_summary.calculate_required_rate(self, 'batting')
                out_file.puts("Required Run Rate - #{tot_summary.required_rate}%")
            end
            if bowling_ending === true
                ending = true
            end
            bowling_summary(out_file, tot_summary)
        else
            bowling_summary(out_file, tot_summary)
            if bowling_ending === true
                tot_summary.calculate_required_rate(self, 'bowling')
                out_file.puts("Required Run Rate - #{tot_summary.required_rate}%")
            end
            if batting_ending === true
                ending = true
            end
            batting_summary(out_file, tot_summary)
        end
        if ending === true
            if tot_summary.tot_run_scored > tot_summary.tot_run_given
                diff = tot_summary.tot_run_scored - tot_summary.tot_run_given
                out_file.puts("#{tot_summary.team_name} won")
            elsif tot_summary.tot_run_scored < tot_summary.tot_run_given
                diff = tot_summary.tot_run_given - tot_summary.tot_run_scored
                out_file.puts("#{tot_summary.team_name} lost")
            else
                out_file.puts("Match Drawn")
            end
        end
        out_file.close    
    end
    def batting_summary(out_file, tot_summary)
        if tot_summary.tot_run_scored > 0
            out_file.puts("Batting Summary")
            out_file.puts("--------------------------------------------------")
            out_file.puts("--------------------------------------------------")
            out_file.puts("Player Name | Player Type | Run | Strike rate | Out")
            tot_summary.players.each do |key, value|
                if tot_summary.players[key].ball_played > 0
                    captain = tot_summary.players[key].captain === true ? '(C)' : ''
                    out_file.puts("#{tot_summary.players[key].player_name} #{captain} | #{tot_summary.players[key].player_type_conversion(tot_summary.players[key].player_type)} | #{tot_summary.players[key].run_scored}(#{tot_summary.players[key].ball_played}) | #{tot_summary.players[key].strike_rate}% | #{tot_summary.players[key].out_type}")
                end
            end
            out_file.puts("Total Run Scored - #{tot_summary.tot_run_scored}")
            out_file.puts("--------------------------------------------------")
            out_file.puts("--------------------------------------------------")
        end
    end
    def bowling_summary(out_file, tot_summary)
        if tot_summary.tot_run_given > 0
            out_file.puts("Bowling Summary")
            out_file.puts("--------------------------------------------------")
            out_file.puts("--------------------------------------------------")
            out_file.puts("Player Name | Over | Run | Wicket | Economy")
            tot_summary.players.each do |key, value|
                if tot_summary.players[key].ball_bowled > 0 && tot_summary.players[key].ball_bowled < OneOver
                    overs_bowled = BallToFloat[tot_summary.players[key].ball_bowled]
                else 
                    overs_bowled = (tot_summary.players[key].ball_bowled.to_f/OneOver).round(1)
                end
                if tot_summary.players[key].ball_bowled > 0
                    out_file.puts("#{tot_summary.players[key].player_name} | #{overs_bowled} | #{tot_summary.players[key].run_given} | #{tot_summary.players[key].bowler_wicket_no} | #{tot_summary.players[key].bowling_economy}")
                end
            end
            out_file.puts("Total Run Given - #{tot_summary.tot_run_given}")
            out_file.puts("--------------------------------------------------")
            out_file.puts("--------------------------------------------------")
        end
    end
end



