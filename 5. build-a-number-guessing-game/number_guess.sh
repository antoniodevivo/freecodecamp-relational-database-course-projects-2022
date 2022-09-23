#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
IFS=' '

SECRET_NUMBER=$((1 + $RANDOM % 1000))

echo $SECRET_NUMBER


echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  USER_INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  INIT_GAMES_RESULT=$($PSQL "INSERT INTO games(user_id, best_game) VALUES($USER_ID, 999999)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES=$($PSQL "SELECT games_played, best_game FROM games WHERE user_id=$USER_ID")

  read -r GAMES_PLAYED BAR BEST_GAME <<< $GAMES
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


NUMBER_OF_GUESSES=0
echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESSED_NUMBER
  ((NUMBER_OF_GUESSES++))

  if [[ $GUESSED_NUMBER != $SECRET_NUMBER ]]
  then

    if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    fi

    if [[ $SECRET_NUMBER < $GUESSED_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi

    if [[ $SECRET_NUMBER > $GUESSED_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi

  else
    STATS=$($PSQL "SELECT games_played, best_game FROM games WHERE user_id=$USER_ID")
    read -r GAMES_PLAYED BAR BEST_GAME <<< $STATS
    ((GAMES_PLAYED++))

    if [[ $NUMBER_OF_GUESSES < $BEST_GAME ]]
    then
      BEST_GAME=$NUMBER_OF_GUESSES
    fi

    STATS_UPDATE_RESULT=$($PSQL "UPDATE games SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID")

    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done
