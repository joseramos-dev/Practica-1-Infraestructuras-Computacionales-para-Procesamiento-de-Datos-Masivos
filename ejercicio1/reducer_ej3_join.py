#!/usr/bin/env python3
import sys

usuario_actual = None
pais = None
por_tipo = {}          # {tipo: [suma_duracion, n_eventos]}

def emitir(pais, por_tipo):
    for tipo, (suma, n) in por_tipo.items():
        print(f"{pais if pais else 'desconocido'}\t{tipo}\t{suma}\t{n}")

for linea in sys.stdin:
    campos = linea.strip().split('\t')
    if len(campos) < 2:
        continue
    usuario_id, etiqueta = campos[0], campos[1]

    if usuario_id != usuario_actual:
        if usuario_actual is not None:
            emitir(pais, por_tipo)
        usuario_actual = usuario_id
        pais = None
        por_tipo = {}

    if etiqueta == "U":
        pais = campos[2]
    elif etiqueta == "E" and len(campos) == 4:
        tipo, duracion = campos[2], int(campos[3])
        acum = por_tipo.setdefault(tipo, [0, 0])
        acum[0] += duracion
        acum[1] += 1

if usuario_actual is not None:
    emitir(pais, por_tipo)
