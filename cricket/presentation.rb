require './match'
require './player'
require './team'
puts "Enter the match type - t20 / odi / test"
input_match_type = gets.chomp
match = Match.new(input_match_type, false, 0, {}, 6, {})
match.set_over_days
i = 1
puts "Enter the team name"
team_name = gets.chomp
team = Team.new(team_name, 5, 0, 0, {}, 0, 0)
while i <= team.tot_player
    puts "Enter player type =  batsman - press 1/bowler - press 2/allrounder - press 3"
    player_type = gets.chomp.to_i
    puts "Enter player name"
    player_name = gets.chomp
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
    puts "Win toss and elected to bat"
else
    puts "Fail toss"
end
match.batting(team)
puts "--------------------------------------------------"
puts "--------------------------------------------------"
match.bowling(team)

