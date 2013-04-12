class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |player|
    if player[1] =~ /[^RPS]/i
      raise NoSuchStrategyError
    end
  end
  if game[0][1] =~ /R/i
    if game[1][1] =~ /[RS]/i
      return game[0]
    else
      return game[1]
    end
  end
  if game[0][1] =~ /P/i
    if game[1][1] =~ /[PR]/i
      return game[0]
    else
      return game[1]
    end
  end
  if game[0][1] =~ /S/i
    if game[1][1] =~ /[PS]/i
      return game[0]
    else
      return game[1]
    end
  end
end


def rps_tournament_winner(tournament)
  if tournament[0][0] =~ /\w/
    return rps_game_winner(tournament)
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]),rps_tournament_winner(tournament[1])])
  end
end

#tournament = [[[[["Camille", "R"], ["Kiele", "P"]], [["Faydra", "R"], ["Berni", "P"]]], [[["Myrlene", "S"], ["Winna", "R"]], [["Hanna", "P"], ["Eadie", "S"]]]], [[[["Rickie", "R"], ["Margaretta", "P"]], [["Kizzie", "P"], ["Ricca", "R"]]], [[["Ruth", "P"], ["Berenice", "P"]], [["Halimeda", "R"], ["Rachelle", "S"]]]]]

#puts rps_game_winner([ [ "Armando", "R" ], [ "Dave", "S" ] ]).inspect
#puts rps_tournament_winner(tournament).inspect