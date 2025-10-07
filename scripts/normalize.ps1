$paths = @("contracts/quarter-life-crisis-trigger-scheduler.clar","contracts/cosmic-insignificance-perspective-engine.clar")
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
foreach ($p in $paths) {
  $c = Get-Content -Raw $p
  $c = $c -replace "`r`n", "`n"
  [System.IO.File]::WriteAllText($p, $c, $utf8NoBom)
}
