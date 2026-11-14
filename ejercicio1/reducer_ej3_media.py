#!/usr/bin/env python3
import sys

result = {}            # {(pais, tipo): [suma_duracion, n_eventos]}

for linea in sys.stdin:
    campos = linea.strip().split('\t')
    if len(campos) != 4:
        continue
    pais, tipo, suma, n = campos
    acum = result.setdefault((pais, tipo), [0, 0])
    acum[0] += int(suma)
    acum[1] += int(n)

for (pais, tipo), (suma, n) in sorted(result.items()):
    print(f"{pais}\t{tipo}\t{suma / n:.2f}")
