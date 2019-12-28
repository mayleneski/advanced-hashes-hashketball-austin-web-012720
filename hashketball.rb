require 'pry'
def game_hash
{
   :home => {
     :team_name => "Brooklyn Nets",
     :colors => ["Black", "White"],
     :players => [
       {
         :player_name => "Alan Anderson",
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
       },
       {
         :player_name => "Reggie Evans",
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12, 
         :slam_dunks => 7
       },
       {
         :player_name => "Brook Lopez",
         :number => 11,
         :shoe => 17, 
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
       },
       {
         :player_name => "Mason Plumlee",
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
       },
       {
         :player_name => "Jason Terry",
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
       }
       ]
   },
   :away => {
     :team_name => "Charlotte Hornets",
     :colors => ["Turquoise", "Purple"],
     :players => [
       {
         :player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
       },
       {
         :player_name => "Bismack Biyombo",
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10
       },
       {
         :player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
       },
       {
         :player_name => "Ben Gordon",
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
       },
       {
         :player_name => "Kemba Walker",
         :number => 33,
         :shoe => 15, 
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12
       }
       ]
   }
 } 
end  

def num_points_scored(players_name)
  game_hash.each do |team, hash|
    hash.each do |key, value|
      if key == :players
        value.each do |player_hash|
          if player_hash[:player_name] == players_name
            return player_hash[:points]
          end  
        end  
      end  
    end  
  end  
end  

def shoe_size(players_name)
  game_hash.each do |team, hash|
    hash.each do |key, value|
     if key == :players
       value.each do |player_hash|
         if player_hash[:player_name] == players_name
           return player_hash[:shoe]
         end     
       end     
     end 
    end  
  end
end  

def team_colors(team_name)
  game_hash.each do |team, hash|
    hash.each do |key, value|
      if value == team_name
       return hash[:colors]
      end  
    end  
  end  
end  

def team_names
  team_names_array = []
  
  game_hash.map do |team, hash|
    team_names_array.push(hash[:team_name])
  end 
  team_names_array
end  

def player_numbers(team_name)
  jersey_numbers = []
  
  game_hash.each do |team, hash|
    if hash[:team_name] == team_name
      hash[:players].each do |player_hash|
        jersey_numbers.push(player_hash[:number])
      end  
    end  
  end
  jersey_numbers
end  

def player_stats(players_name)
  new_hash = {}
  
  game_hash.each do |team, hash|
    hash.each do |key, value|
      if key == :players
        value.each do |player_hash|
          if player_hash[:player_name] == players_name
            player_hash.each do |statistic, number|
              new_hash[statistic] = number
            end  
          end  
        end  
      end  
    end  
  end  
new_hash.delete(:player_name)
new_hash
end  

def big_shoe_rebounds
  hash_compare = {}
  
  game_hash.each do |team, hash|
    hash.each do |key, value|
     if key == :players
       value.each do |player_hash|
         hash_compare[player_hash[:player_name]] = player_hash[:shoe]
       end
     end   
    end  
  end
  max_value = 0
  key_for_max_value = nil
  
  hash_compare.each_pair do |key, value|
   if value > max_value
     max_value = value
     key_for_max_value = key
   end
  end 
  return player_stats(key_for_max_value)[:rebounds]
end  

def most_points_scored
  points_hash = {}
  
  game_hash.each do |team, hash|
    hash.each do |key, value|
      if key == :players
        value.each do |player_hash|
        points_hash[player_hash[:player_name]] = player_hash[:points]
        end  
      end  
    end  
  end
  max_value = 0
  key_for_max_value = nil
  
  points_hash.each_pair do |key, value|
   if value > max_value
     max_value = value
     key_for_max_value = key
   end   
  end  
  return key_for_max_value
end  

def winning_team
  total_home_points = []
  total_away_points = []
  
  game_hash[:home][:players].map do |player_hash|
   total_home_points << player_hash[:points]
  end
   home_points = total_home_points.reduce(0) do |total, num|
     total + num
   end 
   
   game_hash[:away][:players].map do |player_hash|
     total_away_points << player_hash[:points]
   end   
   away_points = total_away_points.reduce(0) do |total, num|
     total + num
   end
   
   if home_points > away_points
     return game_hash[:home][:team_name]
   else
     return game_hash[:away][:team_name]
   end   
end 

def player_with_longest_name
  players_names_array = []
  
  game_hash.each do |team, hash|
    hash.each do |key, value|
      if key == :players
        value.each do |player_hash|
          players_names_array << player_hash[:player_name]
        end  
      end  
    end  
  end
  
  i = 1
  longest_name = players_names_array[0]
  
  while i < players_names_array.length
    if players_names_array[i].length > longest_name.length
      longest_name = players_names_array[i]
    end 
    i += 1
  end
  longest_name
end  

def long_name_steals_a_ton?
  steals = []
  
  game_hash.each do |team, hash|
    hash.each do |key, value|
      if key == :players 
        value.each do |player_hash|
          steals << player_hash[:steals]
        end  
      end  
    end  
  end 
  if player_stats(player_with_longest_name)[:steals] >= steals.max
    return true
  end
end  









