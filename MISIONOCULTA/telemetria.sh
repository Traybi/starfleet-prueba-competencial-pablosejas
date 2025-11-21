#!/bin/bash
# Este script obtiene información sobre el sistema.

echo "Información del Sistema:"
echo "Versión del Kernel: $(uname -r)"
echo "Tiempo encendido: $(uptime -p)"
echo "Uso de Memoria: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
