#!/usr/bin/env python3
import sys

usuario_actual = None
pais = None
n_eventos = 0

def emitir(pais, n_eventos):
    if n_eventos > 0:
        print(f"{pais if pais else 'desconocido'}\t{n_eventos}")

for linea in sys.stdin:
    campos = linea.strip().split('\t')
    if len(campos) < 2:
        continue
    usuario_id, etiqueta = campos[0], campos[1]

    # Cambio de usuario: emitir el anterior y reiniciar
    if usuario_id != usuario_actual:
        if usuario_actual is not None:
            emitir(pais, n_eventos)
        usuario_actual = usuario_id
        pais = None
        n_eventos = 0

    if etiqueta == "U":
        pais = campos[2]
    elif etiqueta == "E":
        n_eventos += 1

# último usuario
if usuario_actual is not None:
    emitir(pais, n_eventos)
