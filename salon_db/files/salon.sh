#!/bin/bash
# NO SQL INJECTION PROTECTION

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

SERVICE_ID_SELECTED=""
SERVICE_NAME_SELECTED=""
CUSTOMER_PHONE=""
CUSTOMER_NAME=""
CUSTOMER_ID=""
SERVICE_TIME=""

display_list() {
  printf "$($PSQL "SELECT service_id, name FROM services ORDER BY service_id" | sed s/\|/\)\ /g)"
  printf "\n"
  read_service
  return 0
}

finish_loop() {
  # $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID::integer, $SERVICE_ID::integer, '$SERVICE_TIME'::caracter varying)"
  resp=$($PSQL "INSERT INTO appointments(customer_id, service_id, time)
  VALUES (
  (SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE')::integer,
    $SERVICE_ID_SELECTED::integer,
  '$SERVICE_TIME'::character varying
  );")
  printf "I have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

read_name() {
  printf "I don't have a record for that phone number, what's your name?\n"
  read CUSTOMER_NAME
  printf "\n"

  # Reg user
  CUSTOMER_ID=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE') RETURNING customer_id;")
  # Ask time
  read_time
}

read_time() {
  printf "What time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?\n"
  read SERVICE_TIME
  printf "\n"
  finish_loop
  return 0
}

read_phone() {
  printf "What's your phone number?\n"
  read CUSTOMER_PHONE
  printf "\n"
  t2=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'::character varying")
  if [ -z $t2 ]; then
    read_name
    return 1
  fi
  CUSTOMER_NAME=$t2
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'::character varying")
  read_time
}

read_service(){
  read SERVICE_ID_SELECTED
  printf "\n"
  t1=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED::integer")
  if [ -z $t1 ]; then
    printf "I could not find that service. What would you like today?\n"
    display_list
    return 0
  fi
  SERVICE_NAME_SELECTED=$t1
  read_phone
}

printf "\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n\n"
display_list