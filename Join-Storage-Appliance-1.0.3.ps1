[CmdletBinding()]
param(
  [string]$OutputPath = (Join-Path $PSScriptRoot 'Storage-Appliance-1.0.3.ova')
)

$ErrorActionPreference = 'Stop'
$parts = @(
  (Join-Path $PSScriptRoot 'Storage-Appliance-1.0.3.ova.part01'),
  (Join-Path $PSScriptRoot 'Storage-Appliance-1.0.3.ova.part02')
)
$expected = '7127a943e863643fb932b71a4df63e954fb2dcbc47d43e96d55c1ad488d05bea'

foreach ($part in $parts) {
  if (-not (Test-Path -LiteralPath $part -PathType Leaf)) {
    throw "Missing release part: $([IO.Path]::GetFileName($part))"
  }
}
if (Test-Path -LiteralPath $OutputPath) {
  throw "Refusing to overwrite existing output: $OutputPath"
}

$output = [IO.File]::Open($OutputPath, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
try {
  foreach ($part in $parts) {
    $inputStream = [IO.File]::OpenRead($part)
    try { $inputStream.CopyTo($output) }
    finally { $inputStream.Dispose() }
  }
}
finally { $output.Dispose() }

$actual = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($actual -ne $expected) {
  throw "OVA checksum mismatch. Expected $expected but found $actual."
}
Write-Output "Created and verified $OutputPath"
