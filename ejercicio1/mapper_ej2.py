#!/usr/bin/env python3
import sys

for linea in sys.stdin:
    splitted = linea.strip().split(';')
    if(splitted[0]=="evento_id"):
        continue
    tipo = splitted[4]
    id_usuario = splitted[1]
    print(f"{tipo}\t{id_usuario}")
