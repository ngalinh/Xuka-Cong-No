#!/bin/bash
# Hourly snapshot of xuka_data.json, kept for 7 days then auto-pruned.
# Installed as a cron job by .github/workflows/deploy.yml — runs from the
# same folder it's deployed into, so it needs no path configuration.
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p backups

if [ -f xuka_data.json ]; then
  cp xuka_data.json "backups/xuka_data-$(date +%Y%m%d-%H%M%S).json"
fi

find backups -name 'xuka_data-*.json' -mtime +7 -delete
