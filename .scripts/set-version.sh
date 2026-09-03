#!/usr/bin/env bash
# Writes the given semantic version into the VERSION_* constants of the mod.
#
# Usage: set-version.sh <major.minor.patch>
set -euo pipefail

VERSION="${1:-}"
if [[ ! "$VERSION" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
    echo "Usage: $0 <major.minor.patch>" >&2
    exit 1
fi
MAJOR="${BASH_REMATCH[1]}"
MINOR="${BASH_REMATCH[2]}"
PATCH="${BASH_REMATCH[3]}"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SETTINGS_FILE="$REPO_ROOT/BlackMarketSoldierStats/Src/BlackMarketSoldierStats/Classes/BlackMarketSoldierStats_Settings.uc"

sed -i \
    -e "s/^const VERSION_MAJOR = [0-9]\+;$/const VERSION_MAJOR = $MAJOR;/" \
    -e "s/^const VERSION_MINOR = [0-9]\+;$/const VERSION_MINOR = $MINOR;/" \
    -e "s/^const VERSION_PATCH = [0-9]\+;$/const VERSION_PATCH = $PATCH;/" \
    "$SETTINGS_FILE"

for CONSTANT in "VERSION_MAJOR = $MAJOR" "VERSION_MINOR = $MINOR" "VERSION_PATCH = $PATCH"; do
    if ! grep -q "^const $CONSTANT;$" "$SETTINGS_FILE"; then
        echo "Failed to set $CONSTANT in $SETTINGS_FILE" >&2
        exit 1
    fi
done

echo "Set mod version to $VERSION"
