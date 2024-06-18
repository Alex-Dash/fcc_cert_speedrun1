#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

basereq="SELECT
e.atomic_number,
e.name,
e.symbol,
t.type,
p.atomic_mass,
p.melting_point_celsius,
p.boiling_point_celsius
FROM elements e
LEFT JOIN properties p ON p.atomic_number=e.atomic_number
LEFT JOIN types t ON t.type_id=p.type_id"
# IFS='|' res=()

if [[ ! -n $1 ]]; then
  printf "Please provide an element as an argument.\n"
  exit 0
fi

printinfo(){
  IFS='|' read -r -a array <<< "$1"
  if [ ${#array[@]} -le 6 ]; then
    echo "I could not find that element in the database."
    exit 0
  fi
  echo "The element with atomic number ${array[0]} is ${array[1]} (${array[2]}). It's a ${array[3]}, with a mass of ${array[4]} amu. ${array[1]} has a melting point of ${array[5]} celsius and a boiling point of ${array[6]} celsius."
}

entry(){
  re='^[0-9]+$'
  if [[ $1 =~ $re ]] ; then
    res_str="$($PSQL "$basereq  WHERE e.atomic_number=$1")"
    printinfo $res_str
  elif [ ${#1} -le 2 ]; then
    res_str="$($PSQL "$basereq  WHERE e.symbol='$1'")"
    printinfo $res_str
  else
    res_str="$($PSQL "$basereq  WHERE e.name='$1'")"
    printinfo $res_str
  fi
}

entry $1