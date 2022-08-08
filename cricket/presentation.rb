require './match'
require './player'
require './team'
puts "Enter the match type - t20 / odi / test"
input_match_type = gets.chomp
match = Match.new(input_match_type, false, 0, 0, {}, 6)
match.set_over_days
i = 1
puts "Enter the team name"
team_name = gets.chomp
team1 = Team.new(team_name, 2, 0, 0, {}, 0, 0)
while i <= team1.tot_player
    puts "Enter player type =  batsman - press 1/bowler - press 2/allrounder - press 3"
    player_type = gets.chomp.to_i
    puts "Enter player name"
    player_name = gets.chomp
    player = Player.new(player_type, player_name, 0, 0, 0, 0, false, false, "")
=begin
    team1.players[player.player_name] = {"player_name" => player.player_name, 
    "player_type" => player.player_type_conversion(player.player_type), "tot_run" => player.tot_run, "tot_wicket" => player.tot_wicket, "strike_rate" => player.strike_rate, "bowling_economy" => player.bowling_economy, "captain" => player.captain,
    "out" => player.out, "out_type" => player.out_type  }
=end
    team1.players[player.player_name] = player
    i = i + 1
end
puts team1.players['Kohli']['player_type']
puts "Enter captain name"
captain = gets.chomp
team1.select_captain(captain)
if match.select_toss === true
    puts "Win toss and elected to bat"
else
    puts "Fail toss"
end
puts "Enter the player name for batting"
batting_player = gets.chomp
i = 1
while i <= match.overs
    j = 1
    while j <= match.one_over && team1.tot_player_out <= team1.tot_player
        player.check_run_or_out(match)
        puts player.out
        if player.out == true
            puts "Enter the player name for batting"
            batting_player = gets.chomp
            team1.tot_player_out = team1.tot_player_out + 1
            team1.players[batting_player]["out"] = player.out
            team1.players[batting_player]["out_type"] = player.out_type
        else
            team1.players[batting_player]["tot_run"] = player.tot_run
        end
        j = j + 1
    end
    i = i + 1
end
puts team1.players
