#!/usr/bin/env python3
import sys

for linea in sys.stdin:
    campos = linea.strip().split(';')

    if campos[0] in ("usuario_id", "evento_id"):
        continue

    if len(campos) == 6:          # usuarios.csv
        usuario_id = campos[0]
        pais = campos[3].strip()
        print(f"{usuario_id}\tU\t{pais}")

    elif len(campos) == 8:        # eventos.csv
        usuario_id = campos[1]
        print(f"{usuario_id}\tE")
