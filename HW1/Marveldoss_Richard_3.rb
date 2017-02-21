
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  if game.length!=2                          #condition to check if the no of particpants is 2
      raise WrongNumberOfPlayersError,"Wrong number of players entered"
  else
      player1_choice=game[0][1]
      player2_choice=game[1][1]               #below contains condition to check if the players made avalid choice
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
          raise NoSuchStrategyError,"Incorrect strategy"
      end
  end
end
            
            
    ############ main function for getting inputs and for the two element list     
        
print "Enter details for 1st player\n"
print"1st player name :"
name=gets.chomp
print"\nROCK(r),PAPER(p),SCISSOR(s)"
element=gets.chomp
element.downcase!
a=[name,element]
#second player
print "\nEnter details for 2nd player\n"
print"2nd player name: "
name=gets.chomp
print"\nROCK(r),PAPER(p),SCISSOR(s) !!only lower case!!"
element=gets.chomp
element.downcase!
b=[name,element]
game=[a,b]
winner=rps_game_winner(game)                     #Function to find the winner is called
print " The winner is :"
print winner


