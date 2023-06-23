#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c";

MAIN() {
  VALUE=$1
  ELEMENT_RESULT=$($PSQL "SELECT e.atomic_number,e.symbol,e.name,p.atomic_mass,p.melting_point_celsius,p.boiling_point_celsius,t.type 
                          FROM properties AS p 
                          FULL JOIN elements AS e ON e.atomic_number=p.atomic_number 
                          FULL JOIN types AS t ON t.type_id=p.type_id 
                          WHERE
                          CAST(e.atomic_number AS VARCHAR) = '$VALUE' 
                          OR e.name = '$VALUE' 
                          OR e.symbol = '$VALUE'")
  echo "$ELEMENT_RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELTING BAR BOILING BAR TYPE
  do
    if [[ -z $ELEMENT_RESULT ]]
    then
      echo -e "I could not find that element in the database."
    else
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
  done
}

if [[ $1 ]]
then
  MAIN $1
else
  echo -e "Please provide an element as an argument."
fi