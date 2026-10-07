[CmdletBinding()]
param(
  [string]$OutputPath = (Join-Path $PSScriptRoot 'Storage-Appliance-1.2.0.ova')
)

$ErrorActionPreference = 'Stop'
$parts = @(
  (Join-Path $PSScriptRoot 'Storage-Appliance-1.2.0.ova.part01'),
  (Join-Path $PSScriptRoot 'Storage-Appliance-1.2.0.ova.part02')
)
$expected = '6d153a7bc0839c66e44f84563a5f606e3935aafb36b5d20079fa3f8635057d15'

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
