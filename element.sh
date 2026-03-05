PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]] 
then
  echo "Please provide an element as an argument."
else

  #get atomic number
  if [[ $1 =~ ^[0-9]{1,3}$ ]]
  then
    ATOMIC_NUMBER=$1
  else
    if [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    else
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    fi
  fi

  FIND_ATOMIC_NUMBER_RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  if [[ $FIND_ATOMIC_NUMBER_RESULT ]]
  then
    # join with types table to retrieve element type and drop old properties.type column
    GET_INFO_RESULT=$($PSQL "SELECT elements.atomic_number, symbol, name, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius
      FROM elements
      JOIN properties ON elements.atomic_number = properties.atomic_number
      JOIN types ON properties.type_id = types.type_id
      WHERE elements.atomic_number=$ATOMIC_NUMBER")
    echo "$GET_INFO_RESULT" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  else
    echo "I could not find that element in the database."
  fi
fi

#jkalasda
# DROP_TYPE_RESULT=$($PSQL "ALTER TABLE properties DROP COLUMN type")

