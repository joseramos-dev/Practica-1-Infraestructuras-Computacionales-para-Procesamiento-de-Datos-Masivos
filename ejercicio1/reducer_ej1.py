#!/usr/bin/env python3
import sys

result = {}

for linea in sys.stdin:
    tipo = linea.strip()
    if not tipo:
        continue
    result[tipo] = result.get(tipo,0) + 1 

for key,value in result.items():
    print(f"{key}\t{value}")
    
