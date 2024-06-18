#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only --no-align -q -c"

not_so_secret_number=$((1 + $RANDOM % 1000))
i_use_arch_btw=""
ttl_games=0
best_game=0
current_game=0
goober_exists=false
uid=-1

guess_print_entry="Guess the secret number between 1 and 1000: "

first_timer(){
  printf "Welcome, $i_use_arch_btw! It looks like this is your first time here.\n"
}

known_user(){
  printf "Welcome back, $i_use_arch_btw! You have played $ttl_games games, and your best game took $best_game guesses.\n"
}

checkint(){
  if [[ userguess -lt not_so_secret_number ]]; then
    printf "It's higher than that, guess again: "
  elif [[ userguess -gt not_so_secret_number ]]; then
    printf "It's lower than that, guess again: "
  else
    printf "You guessed it in $current_game tries. The secret number was $not_so_secret_number. Nice job!\n"
  fi
}

finishing_touch(){
  if [ "$goober_exists" = false ]; then
    uid=$($PSQL "INSERT INTO users(name) VALUES ('$i_use_arch_btw') RETURNING id;")
  fi
  res=$($PSQL "INSERT INTO games(user_id, result) VALUES ($uid, $current_game) RETURNING id;")
}

try_guess_my_ass(){
  re='^[0-9]+$'
  read userguess
  if [[ $userguess =~ $re ]] ; then
    checkint
  else
    printf "That is not an integer, guess again: "
  fi
}

entry(){
  printf "Enter your username: "
  read i_use_arch_btw
  uid=$($PSQL "SELECT id FROM users WHERE name='$i_use_arch_btw'")

  if [[ ! -n "$uid" ]]; then
    goober_exists=false
    first_timer
  else
    goober_exists=true
    best_game=$($PSQL "SELECT min(result) FROM games WHERE user_id=$uid")
    ttl_games=$($PSQL "SELECT count(id) FROM games WHERE user_id=$uid")
    known_user
  fi

  printf "$guess_print_entry"
  while [[ $userguess != $not_so_secret_number ]]
  do
    ((current_game++))
    try_guess_my_ass
  done
  finishing_touch
}

entry