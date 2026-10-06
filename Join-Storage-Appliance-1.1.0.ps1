[CmdletBinding()]
param(
  [string]$OutputPath = (Join-Path $PSScriptRoot 'Storage-Appliance-1.1.0.ova')
)

$ErrorActionPreference = 'Stop'
$parts = @(
  (Join-Path $PSScriptRoot 'Storage-Appliance-1.1.0.ova.part01'),
  (Join-Path $PSScriptRoot 'Storage-Appliance-1.1.0.ova.part02')
)
$expected = '8f3f304f9cff0814d4573e730c422cf52cb4c8e8491ee12d473b690e1d675ea1'

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
