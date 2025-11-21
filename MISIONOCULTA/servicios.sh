#!/bin/bash
# Este script verifica si los servicios críticos están activos.

echo "Estado de Servicios Críticos:"
for servicio in apache2 mysql ufw; do
  estado=$(systemctl is-active $servicio)
  echo "$servicio: $estado"
done
