#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
WIN=0

SECRET_NUMBER=$((( RANDOM % 1000 ) + 1 ))
echo $SECRET_NUMBER

echo "Enter your username:"
read USERNAME

USER_RESULT=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_RESULT ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', 0, 0)")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "Guess the secret number between 1 and 1000:"

while [ $WIN -eq 0 ]
do
  read INPUT_NUMBER
  ((NUMBER_OF_GESSES++))
  
  while ! [[ $INPUT_NUMBER =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read INPUT_NUMBER
    ((NUMBER_OF_GESSES++))
  done

  if [[ $INPUT_NUMBER == $SECRET_NUMBER ]]
  then
    ((GAMES_PLAYED++))
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'")
    if [[ $NUMBER_OF_GESSES -gt $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GESSES WHERE username = '$USERNAME'")
    fi
    echo "You guessed it in $NUMBER_OF_GESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    WIN=1
  elif [[ $INPUT_NUMBER -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done