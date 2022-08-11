require './match'
class Test < Match
    def batting(innings1, innings2, innings_no)
        innings2_run_scored = innings1.tot_run_scored + innings2.tot_run_scored
        innings2_run_given = innings1.tot_run_given + innings2.tot_run_given
        if(innings_no == 2 && innings2.tot_run_given > 0  && innings2_run_given < innings2_run_scored)
            return
        end
        if innings_no == 1
            team = innings1
        else
            team = innings2
        end
        counter = 0
        tot_player_out = 0
        do_break = false
        batting_player = team.check_player_exist_batting()
        ending = false 
        while do_break === false
            unit_run_batting = team.players[batting_player].check_run_or_out_batting(self)
            team.tot_run_scored = team.tot_run_scored + unit_run_batting
            innings2_run_scored = innings1.tot_run_scored + innings2.tot_run_scored
            innings2_run_given = innings1.tot_run_given + innings2.tot_run_given        
            if(innings_no == 2 && innings2.tot_run_scored > 0  && innings2.tot_run_given > 0 && innings2_run_scored > innings2_run_given)
                ending = true
                do_break = true
            end
            if team.players[batting_player].out === true
                tot_player_out = tot_player_out + 1
                if tot_player_out == team.class::TotPlayer
                    do_break = true
                else
                    batting_player = team.check_player_exist_batting()
                end
            end 
            if(innings_no == 2 && innings2.tot_run_scored > 0  && innings2_run_scored < innings2_run_given && tot_player_out == team.class::TotPlayer)
                ending = true
                do_break = true
            end  
            counter = counter + 1
            if counter % 6 == 0 || do_break === true 
                if ending === true
                    match_summary(innings1, innings2, innings_no, true)
                else
                    match_summary(innings1, innings2, innings_no,false)
                end
            end
            break if do_break
        end
    end
    def bowling(innings1, innings2, innings_no)
        innings2_run_scored = innings1.tot_run_scored + innings2.tot_run_scored
        innings2_run_given = innings1.tot_run_given + innings2.tot_run_given
        if(innings_no == 2 && innings2.tot_run_scored > 0  && innings2_run_scored < innings2_run_given)
            return
        end  
        if innings_no == 1
            team = innings1
        else
            team = innings2
        end
        tot_player_out = 0
        do_break = false
        counter = 0
        ending = false
        while do_break === false
            if counter == 0 || counter % 6 == 0
                bowling_player = team.check_player_exist_bowling()
            end
            unit_run_bowling = team.players[bowling_player].check_run_or_out_bowling(self)
            team.tot_run_given = team.tot_run_given + unit_run_bowling
            innings2_run_scored = innings1.tot_run_scored + innings2.tot_run_scored
            innings2_run_given = innings1.tot_run_given + innings2.tot_run_given
            if(innings_no == 2 && innings2.tot_run_scored > 0  && innings2.tot_run_given > 0 && innings2_run_scored < innings2_run_given)
                ending = true
                do_break = true
            end
            if team.players[bowling_player].wicket_taken === true
                team.players[bowling_player].wicket_taken = false
                tot_player_out = tot_player_out + 1
                if tot_player_out == team.class::TotPlayer
                    do_break = true
                end
            end
            if(innings_no == 2 && innings2.tot_run_given > 0  && innings2_run_given < innings2_run_scored && tot_player_out == team.class::TotPlayer)
                ending = true
                do_break = true
            end
            counter = counter + 1
            if counter % 6 == 0 || do_break === true 
                if ending === true
                    match_summary(innings1, innings2, innings_no, true)
                else
                    match_summary(innings1, innings2, innings_no,false)
                end
            end
            break if do_break
            
        end
    end
    def match_summary(innings1, innings2, innings_no, ending)
        out_file = File.new("match_summary.txt", "w+")
        out_file.puts("Team Name - #{innings1.team_name}")
        out_file.puts("--------------------------------------------------")
        out_file.puts("--------------------------------------------------")
        out_file.puts("Innings 1")
        out_file.puts("--------------------------------------------------")
        out_file.puts("--------------------------------------------------")
        if @toss === true
            batting_summary(out_file, innings1)
            bowling_summary(out_file, innings1)
            if innings_no == 2
                out_file.puts("Innings 2")
                out_file.puts("--------------------------------------------------")
                out_file.puts("--------------------------------------------------")
                batting_summary(out_file, innings2)
                bowling_summary(out_file, innings2) 
            end
        else
            bowling_summary(out_file, innings1)
            batting_summary(out_file, innings1)
            if innings_no == 2
                out_file.puts("Innings 2")
                out_file.puts("--------------------------------------------------")
                out_file.puts("--------------------------------------------------")
                bowling_summary(out_file, innings2)
                batting_summary(out_file, innings2)
            end
        end
        tot_scored = innings1.tot_run_scored + innings2.tot_run_scored
        tot_given = innings1.tot_run_given + innings2.tot_run_given
        if ending === true
            if tot_scored > tot_given
                out_file.puts("#{innings1.team_name} won")
            elsif tot_scored < tot_given
                out_file.puts("#{innings1.team_name} lost")
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