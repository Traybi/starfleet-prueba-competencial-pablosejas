#!/bin/bash
# Este script lista todos los contenedores de Docker.

echo "Contenedores de Docker:"
sudo docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
