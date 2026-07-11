#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "==> Checking formatting"
bun run check

echo "==> Linting"
bun run lint

echo "==> Type-checking"
bunx tsc --noEmit

echo "==> Running tests"
bunx vitest run --passWithNoTests

echo "==> Building production bundles"
bun run build

echo "==> All checks passed"
