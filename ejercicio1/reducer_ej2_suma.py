#!/usr/bin/env python3
import sys

result = {}

for linea in sys.stdin:
    campos = linea.strip().split('\t')
    if len(campos) != 2:
        continue
    pais, n = campos
    result[pais] = result.get(pais, 0) + int(n)

for pais, total in result.items():
    print(f"{pais}\t{total}")
