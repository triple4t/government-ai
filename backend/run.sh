#!/usr/bin/env bash
# Run the backend with the venv's Python so all dependencies are found.
# Usage: ./run.sh        — development (reload on file change)
#        ./run.sh prod   — production (no reload, bind 0.0.0.0)
cd "$(dirname "$0")"
if [ "${1:-}" = "prod" ]; then
  exec ./venv/bin/python -m uvicorn app.main:app --host 0.0.0.0 --port 8000
else
  exec ./venv/bin/python -m uvicorn app.main:app --reload
fi
