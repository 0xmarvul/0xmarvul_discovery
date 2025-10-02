#!/bin/bash

# 0xMarvul Sensitive Info & Misconfig Discovery Script
# Usage: ./marvul_discovery.sh <domain>

# ===== Banner =====
banner(){
  echo -e "\e[35m"
  echo "=============================================="
  echo "   🚀 0xMarvul Recon & Info-Disclosure Scanner"
  echo "=============================================="
  echo -e "\e[0m"
}

# ===== Check =====
if [ -z "$1" ]; then
  banner
  echo "Usage: $0 <domain>"
  exit 1
fi

domain=$1
output="discovery_$domain.txt"

# ===== Path Categories =====
configs=(
/config.js /config.json /app/config.js /settings.json /database.json /firebase.json
/.env /.env.production /.env.local /.env.dev /.env.backup /.git/config /.git-credentials
/api_keys.json /credentials.json /secrets.json /google-services.json /package.json
/package-lock.json /composer.json /yarn.lock /pom.xml /docker-compose.yml
/manifest.json /service-worker.js /web.config /appsettings.json /local.settings.json
)

backups=(
/backup.zip /backup.tar.gz /site-backup.sql /db.sql /old.zip /test.php~ /index.php.bak
/config.old /config.bak
)

git=(
/.git/HEAD
)

api_docs=(
/swagger.json /swagger-ui.html /api-docs /openapi.json /postman.json
)

logs=(
/debug.log /error.log /access.log /laravel.log
)

misc=(
/robots.txt /security.txt
)

# ===== Function to scan each category =====
scan_category(){
  category_name=$1
  shift
  paths=("$@")
  echo -e "\n\e[36m[+] Scanning Category: $category_name\e[0m"
  subfinder -d "$domain" -silent | while read host; do
    for path in "${paths[@]}"; do
      echo "$host$path"
    done
  done | httpx -mc 200 -title -silent | tee -a "$output"
}

# ===== Start =====
banner
echo -e "\e[33mTarget Domain: $domain\e[0m"
echo "Results will be saved to: $output"
echo "------------------------------------------------------"

# ===== Run Scans =====
scan_category "Sensitive Configs" "${configs[@]}"
scan_category "Backups & Old Files" "${backups[@]}"
scan_category "Exposed Git" "${git[@]}"
scan_category "API Docs & Swagger" "${api_docs[@]}"
scan_category "Log Files" "${logs[@]}"
scan_category "Miscellaneous (robots, security)" "${misc[@]}"

echo -e "\n\e[32m[✓] Done! Check $output for full results.\e[0m"
