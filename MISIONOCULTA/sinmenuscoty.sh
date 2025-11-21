#!/bin/bash
# Script principal que presenta un menú al usuario

opcion="$1"

case $opcion in
  1)
    ./servicios.sh
    ;;
  2)
    ./telemetria.sh
    ;;
  3)
    ./dockerinfo.sh
    ;;
  4)
    ./explorararchivos.sh
    ;;
  *)
    echo "Opción no válida."
    ;;
esac
