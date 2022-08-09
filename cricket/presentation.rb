require './match'
require './player'
require './team'
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
match = Match.new(input_match_type, false, 0, {}, 6, {})
match.set_over_days
team_name = match.check_team_name
i = 1
team = Team.new(team_name, 5, 0, 0, {}, 0, 0)
while i <= team.tot_player
    player_type = team.check_player_type
    player_name = team.check_player_name
    player = Player.new(player_type, player_name, 0, 0, 0, 0, false, false, "", 0, 0, 0, 0)
    team.players[player.player_name] = player
    i = i + 1
end
puts "--------------------------------------------------"
puts "--------------------------------------------------"
team.select_captain()
puts "--------------------------------------------------"
puts "--------------------------------------------------"
if match.select_toss === true
    puts "Won toss and elected to bat"
    match.batting(team)
    puts "--------------------------------------------------"
    puts "--------------------------------------------------"
    match.bowling(team)
else
    puts "Failed toss and elected to ball"
    match.bowling(team)
    puts "--------------------------------------------------"
    puts "--------------------------------------------------"
    match.batting(team)
end


