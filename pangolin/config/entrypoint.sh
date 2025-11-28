#!/bin/sh
set -e

echo "[ENTRYPOINT] Installing envsubst..."
apk add --no-cache gettext >/dev/null 2>&1 || true

echo "[ENTRYPOINT] Generating Pangolin config from template..."

# Validate required environment variables
: "${PANGOLIN_DASHBOARD_URL:?Missing PANGOLIN_DASHBOARD_URL}"
: "${BASE_DOMAIN:?Missing BASE_DOMAIN}"
: "${PANGOLIN_SERVER_SECRET:?Missing PANGOLIN_SERVER_SECRET}"
: "${HEADSCALE_SERVER_URL:?Missing HEADSCALE_SERVER_URL}"

# List files
echo "[ENTRYPOINT] Listing /app/config:"
ls -l /app/config || true

# Substitute variables
envsubst < /app/config/config.template.yaml > /app/config/config.yaml

echo "[ENTRYPOINT] Config generated:"
cat /app/config/config.yaml

echo "[ENTRYPOINT] Starting Pangolin..."
exec "$@"
