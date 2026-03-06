#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUM=$(($RANDOM%1000+1))

echo "for testing only the random number: $RANDOM_NUM"

MAIN_MENU(){
  echo "Enter your username:"
  read USERNAME_INPUT

  FIND_USER_RESULT=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME_INPUT'")
  
  if [[ $FIND_USER_RESULT ]]
  then
    IFS="|" read USER_ID USERNAME NUM_GAMES BEST <<< "$FIND_USER_RESULT"
    echo -e "\nWelcome back, $USERNAME_INPUT! You have played $NUM_GAMES games, and your best game took $BEST guesses.\n"
  else
    echo -e "\nWelcome, $USERNAME_INPUT! It looks like this is your first time here.\n"
    NUM_GAMES=0
    BEST=0
    ADD_USER_RESULT=$($PSQL "INSERT INTO users(username,games_played) VALUES('$USERNAME_INPUT', 0)")
  fi


  declare -i count
  echo "Guess the secret number between 1 and 1000:"
  read NUM_INPUT
  count+=1

  while [[ ! $NUM_INPUT =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read NUM_INPUT
  done
  
  while [[ ! $NUM_INPUT -eq $RANDOM_NUM ]]
  do
    if [[ $NUM_INPUT -lt $RANDOM_NUM ]]
    then 
      echo "It's higher than that, guess again:"
      read NUM_INPUT
      count+=1
    else
      echo "It's lower than that, guess again:"
      read NUM_INPUT
      count+=1
    fi
  done


  echo "You guessed it in $count tries. The secret number was $RANDOM_NUM. Nice job!"
  NUM_GAMES=$((NUM_GAMES+1))

  if [[ $BEST && $count -lt $BEST ]]
  then
    BEST=$count
  else 
    BEST=$count
  fi

  ADD_GAME_RESULT=$($PSQL "UPDATE users SET games_played = $NUM_GAMES, best_game=$BEST WHERE username='$USERNAME_INPUT'")

}

MAIN_MENU