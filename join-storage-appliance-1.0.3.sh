#!/bin/sh
set -eu

directory=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
output="$directory/Storage-Appliance-1.0.3.ova"
expected='7127a943e863643fb932b71a4df63e954fb2dcbc47d43e96d55c1ad488d05bea'

test ! -e "$output" || { echo "Refusing to overwrite $output" >&2; exit 1; }
cat "$directory/Storage-Appliance-1.0.3.ova.part01" \
    "$directory/Storage-Appliance-1.0.3.ova.part02" > "$output"
if command -v sha256sum >/dev/null 2>&1; then
  actual=$(sha256sum "$output" | awk '{print $1}')
else
  actual=$(shasum -a 256 "$output" | awk '{print $1}')
fi
test "$actual" = "$expected" || {
  echo "OVA checksum mismatch. Expected $expected but found $actual." >&2
  exit 1
}
echo "Created and verified $output"
