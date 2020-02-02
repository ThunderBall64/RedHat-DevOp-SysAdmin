#!/bin/bash

echo 'Hello'

WORD='script'

echo "$WORD"

echo '$WORD'

echo "This is a shell $WORD"

echo "This is a shell ${WORD}"

echo "${WORD}ing is fun!"

echo "$WORDing is fun!"

# Creating a new variable
echo='ed'

# Combining the two variables
ENDING='ed'

echo "This is ${WORD}${ENDING}."

ENDING='ing'

echo "${WORD}${ENDING} is fun!"

ENDING='s'
echo "You are going to write many ${WORD}${ENDING} in this class!"


