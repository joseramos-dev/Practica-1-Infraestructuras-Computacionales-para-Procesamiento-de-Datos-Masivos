#!/usr/bin/env python3
import sys

for linea in sys.stdin:
    splitted = linea.trip().split(';')
    if(splitted[0]=="evento_id"):
        continue
    tipo = splitted[4]
    resultado = splitted[7] if splitted[7]!= 'NA' else '0'
    print(f"{tipo}\t{resultado}")
