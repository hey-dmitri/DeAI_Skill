#!/usr/bin/env bash
# Rebuild critic-agent.skill from SKILL.md.
# SKILL.md is the source of truth; this only repackages it for one-step install.
set -euo pipefail

out="$PWD/critic-agent.skill"
tmp="$(mktemp -d)"
mkdir -p "$tmp/critic-agent"
cp SKILL.md "$tmp/critic-agent/SKILL.md"
rm -f "$out"
( cd "$tmp" && zip -qr "$out" critic-agent )
rm -rf "$tmp"
echo "Built critic-agent.skill from SKILL.md"
