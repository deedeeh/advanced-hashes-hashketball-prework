require 'pry'

def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name) 
  result = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats| 
          if player == player_name
            stats.each do |k, v|
              if k == :points
                result = v
              end
            end
          end
        end
      end
    end
  end
  result
end

def shoe_size(player_name)
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, stats| 
          if player == player_name
            stats.map {|k, v| return v if k == :shoe}
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  result = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if game_hash[location].values[0] == team_name && attribute == :colors
        result = data
      end
    end
  end
  result
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_names << data
      end
    end
  end
  team_names
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if game_hash[location].values[0] == team_name && attribute == :players
        data.each do |player, stats|
          stats.each do |k, v|
            if k == :number
              player_numbers << v
            end
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats| 
          if player == player_name 
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = nil
  max = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats| 
          stats.each do |k, v|
            if k == :shoe && v > max 
              max = v
              big_shoe = stats[:rebounds]
            end
          end
        end
      end
    end
  end
  big_shoe
end

def most_points_scored
  player_name = nil
  max = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats| 
          stats.each do |k, v|
            if k == :points && v > max 
              max = v
              player_name = player
            end
          end
        end
      end
    end
  end
  player_name
end

def winning_team
  winning_team = nil
  max = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats| 
          stats.each do |k, v|
            if k == :points && v > max 
              max += v
              winning_team = team_data[:team_name]
            end
          end
        end
      end
    end
  end
  winning_team
end

def player_with_longest_name
  longest_name = nil
  max = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats| 
          if player.length > max 
            max = player.length
            longest_name = player
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  result = nil
  max = 0
   game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats| 
          if player_with_longest_name && stats[:steals] > max
            max = stats[:steals]
            result = true
          else 
            result = false
          end
        end
      end
    end
  end
  result 
end

