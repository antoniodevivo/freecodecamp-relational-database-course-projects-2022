#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ [0-9] ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  else
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1'")
  fi

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    IFS=' '
    read -r ATOMIC_NUMBER BAR SYMBOL BAR NAME <<< $ELEMENT
    
    #recovering properties
    ELEMENT_PROP=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    read -r ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID <<< $ELEMENT_PROP

    #recovering type
    TYPE_RESULT=$($PSQL "SELECT * FROM types WHERE type_id=$TYPE_ID")

    read -r TYPE_ID BAR TYPE <<< $TYPE_RESULT

    # final message
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi