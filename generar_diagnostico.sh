#!/usr/bin/env bash


# Helpers
cmd_exists() { command -v "$1" >/dev/null 2>&1; }

get_service_status() {
  local svc
  for svc in "$@"; do
    if cmd_exists systemctl; then
      status=$(systemctl is-active "$svc" 2>/dev/null || true)
      if [[ -n "$status" ]]; then
        echo "$status"
        return
      fi
    fi
    if cmd_exists service; then
      status=$(service "$svc" status 2>/dev/null | head -n1 || true)
      if [[ -n "$status" ]]; then
        if echo "$status" | grep -qi running; then
          echo "running"
        else
          echo "$status"
        fi
        return
      fi
    fi
  done
  echo "inactive"
}

# Recolección de datos
apache_status=$(get_service_status apache2 httpd)
mysql_status=$(get_service_status mysql mysqld mariadb)
php_version=$(php -v 2>/dev/null | head -n1 | awk '{print $2}' || echo "N/A")
docker_version=$(docker --version 2>/dev/null | awk '{print $3}' || echo "N/A")
kernel_version=$(uname -r)
uptime=$(uptime -p)

# Generar JSON
cat > diagnosticoLCAR.json <<EOF
{
  "apache_status": "$apache_status",
  "mysql_status": "$mysql_status",
  "php_version": "$php_version",
  "docker_version": "$docker_version",
  "kernel_version": "$kernel_version",
  "uptime": "$uptime"
}
EOF
