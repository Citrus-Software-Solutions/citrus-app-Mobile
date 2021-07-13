import os
import sys
import argparse
import re

parser = argparse.ArgumentParser(description='Folder creator para generar los directorios de la arquitectura hexagonal en Flutter')

parser.add_argument('--model', '-m', help="Nombre del modelo", required=True)


def MakeDirs(modelo):
    startCapital = re.match(r"[A-Z]+", modelo[0])
    onlyLetters = re.match(r"^[^\^~`!@#\$%^*_+\[\]{}\\:;?|><=\s-]+$", modelo)
    if(startCapital or not(onlyLetters)):
        parser.error("No se puede crear el modelo, tiene que usar lowerCamelCase")
    else:
        dir = f"lib/{modelo}"
        print(f"Creando... {modelo} en {dir}")
        MakeDir(dir + "/adapter/in")
        MakeDir(dir + "/adapter/out")
        MakeDir(dir + "/application/port/in")
        MakeDir(dir + "/application/port/out")
        MakeDir(dir + "/application/service")
        MakeDir(dir + "/domain/values")
        MakeDir(dir + "/ui/screens")
        MakeDir(dir + "/ui/widgets")

def MakeDir(dir):
    os.makedirs(f"{dir}", exist_ok=True)
    file = open(f"{dir}/.gitkeep", "w")
    file.close()

if __name__ == "__main__":
    args = parser.parse_args()

    if args.model:
        MakeDirs(args.model)