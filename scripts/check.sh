#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "Checking types..."
bun run typecheck

echo "Checking lint..."
bun run lint

echo "Checking formatting..."
bun run check

echo "Running tests..."
if rg --files src | rg -q '\.(test|spec)\.[cm]?[jt]sx?$'; then
  bun run test
else
  echo "No test files found; skipping test runner."
fi

echo "Building production bundle..."
bun run build

echo "All checks passed."
