#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"


echo -e "\n~~~~ WELCOME TO MY SALON ~~~~~~\n\n\n"

SERVICES=$($PSQL "SELECT * FROM services")
SERVICE_IDS=$($PSQL "SELECT service_id FROM services") 

MAIN_MENU(){
  echo "$SERVICES" | while IFS='|' read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED

  if ! [[ ${SERVICE_IDS[*]} =~ "$SERVICE_ID_SELECTED" ]]
  then
    echo -e "Please pick a valid service\n"
    MAIN_MENU
  else
    CREATE_APPOINTMENT
  fi
}

CREATE_APPOINTMENT(){
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nPlease enter your name:"
    read CUSTOMER_NAME

    #insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    echo $INSERT_CUSTOMER_RESULT
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nPlease enter a preferred appointment time:"
  read SERVICE_TIME

  #insert new appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME','$CUSTOMER_ID','$SERVICE_ID_SELECTED')")
  SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

  
  echo "I have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."


}



MAIN_MENU