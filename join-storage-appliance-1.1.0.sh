#!/bin/sh
set -eu

directory=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
output="$directory/Storage-Appliance-1.1.0.ova"
expected='8f3f304f9cff0814d4573e730c422cf52cb4c8e8491ee12d473b690e1d675ea1'

test ! -e "$output" || { echo "Refusing to overwrite $output" >&2; exit 1; }
cat "$directory/Storage-Appliance-1.1.0.ova.part01" \
    "$directory/Storage-Appliance-1.1.0.ova.part02" > "$output"
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
