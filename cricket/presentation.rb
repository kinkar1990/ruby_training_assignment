require './match'
require './player'
require './team'
require './test'
input_match_type = ''
loop do 
    puts "Enter the match type - t20 / odi / test"
    input_match_type = gets.chomp
    if input_match_type.downcase != "t20" && input_match_type.downcase != "odi" && input_match_type.downcase != "test"
        puts "Please enter correct match type"
    else
        break
    end
end
if input_match_type == "test"
    match = Test.new(input_match_type, false, 0)
else
    match = Match.new(input_match_type, false, 0)
end
match.set_over_days
team_name = match.check_team_name
i = 1
team = Team.new(team_name, 0, 0, {}, 0, 0)
if input_match_type == "test"
    team2 = Team.new(team_name, 0, 0, {}, 0, 0) 
end
while i <= team.class::TotPlayer
    player_type = team.check_player_type
    player_name = team.check_player_name
    player = Player.new(player_type, player_name, 0, false, 0, 0, false, false, "", 0, 0, 0, 0)
    team.players[player.player_name] = player
    if input_match_type == "test"
        player2 = Player.new(player_type, player_name, 0, false, 0, 0, false, false, "", 0, 0, 0, 0)
        team2.players[player.player_name] = player2 
    end
    i = i + 1
end
puts "--------------------------------------------------"
puts "--------------------------------------------------"
team.select_captain()
puts "--------------------------------------------------"
puts "--------------------------------------------------"
if match.select_toss === true
    puts "Won toss and elected to bat"
    if input_match_type == "test"
        puts "1st Innings"
        match.batting(team, team2, 1)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        puts "1st Innings"
        match.bowling(team, team2, 1)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        puts "2nd Innings"
        match.batting(team, team2, 2)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        puts "2nd Innings"
        match.bowling(team, team2, 2)
    else
        match.batting(team)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        match.bowling(team)
    end
else
    puts "Failed toss and elected to ball"
    if input_match_type == "test"
        puts "1st Innings"
        match.bowling(team, team2, 1)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        puts "1st Innings"
        match.batting(team, team2, 1)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        puts "2nd Innings"
        match.bowling(team, team2, 2)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        puts "2nd Innings"
        match.batting(team, team2, 2)
    else
        match.bowling(team)
        puts "--------------------------------------------------"
        puts "--------------------------------------------------"
        match.batting(team)
    end
end


