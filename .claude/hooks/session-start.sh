#!/bin/bash
set -euo pipefail

# Only run in remote (web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

echo "Installing Python dependencies..."
pip install -r "$CLAUDE_PROJECT_DIR/requirements.txt" pytest --quiet

echo "Installing Node.js dependencies for web app..."
cd "$CLAUDE_PROJECT_DIR/web" && npm install --silent

echo "Session start hook complete."
