#!/bin/bash
# Script principal que presenta un menú al usuario.

echo "Bienvenido a la Misión Oculta de la Flota Estelar"
echo "Seleccione una opción:"
echo "1) Servicios Críticos"
echo "2) Telemetría del Sistema"
echo "3) Información de Docker"
echo "4) Buscar Archivos Starfleet"

read -p "Ingrese el número de la opción a ejecutar: " opcion

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
