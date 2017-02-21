class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)          #using the same function from question 3
  if game.length!=2
      raise WrongNumberOfPlayersError,"Wrong number of players entered"
  else
      player1_choice=game[0][1]
      player2_choice=game[1][1]
      player1_choice.downcase!
      player2_choice.downcase!
      if ((player1_choice=="r" or player1_choice=="s" or player1_choice=="p") and (player2_choice=="r" or player2_choice=="s" or player2_choice=="p")  )
          if ((player1_choice=="p" or player1_choice=="r") and (player2_choice=="p" or player2_choice=="r"))
              if player1_choice=='p' or player1_choice==player2_choice
                  return game[0]
              else
                  return game[1]
              end
          elsif ((player1_choice=="s" or player1_choice=="r") and (player2_choice=="s" or player2_choice=="r"))
              if player1_choice=='r' or player1_choice==player2_choice
                  return game[0]
              else
                  return game[1]
              end
          else
              if player1_choice=='s' 
                  return game[0]
              else
                  return game[1]
              end
          end
      else
          print player1_choice,player2_choice,"\n"
          raise NoSuchStrategyError,"Incorrect strategy"
      end
  end
end

def rps_tournament_winner(team_list)   #recursion is used till only 2 players are left
    len= team_list[0].length
    #print team_list,"\n"
    #print len,"\n"
    #k=0
    nxt_round=[]
    nxt_tournament=[]
    if len!=1
      team_list.each do |tournament|
        length_tournament=tournament.length
       # print length_tournament,"\n"
        i=0;
        while i<length_tournament do
          player1=rps_game_winner(tournament[i])
          i=i+1
          player2=rps_game_winner(tournament[i])
          assign=[player1,player2]
          nxt_round.push(assign)
          i=i+1
        end
      end
    else
      return(team_list)
    end
        nxt_tournament=[nxt_round]
        #print nxt_round,"\n"
        #print nxt_round.length,"\n"
        return(rps_tournament_winner(nxt_tournament))
end
# Main function where team is intialized and evaluating the matches

team=[
[
  [ ["Kristen", "P"], ["Dave", "S"] ],
  [ ["Richard", "R"], ["Michael", "S"] ],
],
[
  [ ["Allen", "S"], ["Omer", "P"] ],
  [ ["David E.", "R"], ["Richard X.", "P"] ]
]
]

winner=rps_tournament_winner(team) #the set of tournaments are run
winner_final=rps_game_winner(winner[0][0]) # the final match is run again
winner_final[1].upcase!
print winner_final