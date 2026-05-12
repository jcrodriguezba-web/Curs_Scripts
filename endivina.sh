#!/bin/bash
#endevinar -- endivina un número entre 1 y 100 en 5 intents

NUMERO=$((RANDOM % 100 + 1))
INTENTS=5
GANADO=0

echo "Tens $INTENTS intents par endivinar el número."

while [ $INTENTS -gt 0 ]; do
    read -p "Posa un nom (1-100): " RESPOSTA

    if [[ ! $RESPOSTA =~ ^[0-9]+$ ]]; then
        echo "Per favor, introdueix un número valid."
        continue
    fi

    if [ $RESPOSTA -eq $NUMERO ]; then
        echo "Has acertat!!"
        GANADO=1
        break
    else if [ $RESPOSTA -lt $NUMERO ]; then
        echo "El número es mes GRAN."
    else
        echo "El número es mes PETIT."
    fi

    #Comparar RESPOSTA amb Numero i donar la pista (mes gran / mes petit)
    #Actualitzar contador d'intents
    INTENTS=$((INTENTS - 1))
    
    if [ $INTENTS -gt 0 ]; then
        echo "Te queden $INTENTS intentos."
    fi
done

#Missatge final: ha encertat o ha esgotat els intents?
if [ $GANADO -eq 0 ]; then
    echo "¡Oh no! Te has quedat sense intents. El número era: $NUMERO"
fi
