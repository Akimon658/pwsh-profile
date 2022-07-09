function prompt() {
  $currentDir = (Convert-Path .)

  if ($currentDir.Contains($HOME)) {
    $currentDir = $currentDir.Replace($HOME, "~")
  }
  $currentDir = $currentDir.Replace("\", "/")

  Write-Host "$currentDir" -NoNewline -ForegroundColor Green

  $branch = git rev-parse --abbrev-ref HEAD
  if ($branch) {
    Write-Host " ($branch)" -ForegroundColor Blue
  }
  else {
    Write-Host "`r"
  }

  Write-Host '$' -NoNewline -Foregroundcolor White

  return ' '
}

function grep([string] $s) {
  $input | Select-String -Pattern $s -NoEmphasis
}

function ln([switch] $s, [string] $filePath, [string] $symlink) {
  if ($s) {
    New-Item -ItemType SymbolicLink -Value $filePath -Path $symlink | Out-Null
  }
  else {
    New-Item -ItemType HardLink -Value $filePath -Path $symlink | Out-Null
  }
}

Set-Alias ls list
function list([switch] $a, [switch] $l, [string] $path) {
  if ($a) {
    Get-ChildItem $path -Force -Name
  }
  elseif ($l) {
    Get-ChildItem $path
  }
  else {
    Get-ChildItem $path -Name
  }
}

function mkdir([string] $dir) {
  if (Test-Path $dir) {
    Write-Error -Message "cannot  create directory ‘$dir’: File exists"
  }
  else {
    New-Item -ItemType Directory -Path $dir | Out-Null
  }
}

function rm([switch] $f, [switch] $r, [switch] $rf, [string] $path) {
  if ($f) {
    Remove-Item -Path $path -Force
  }
  elseif ($r) {
    Remove-Item -Path $path -Recurse
  }
  elseif ($rf) {
    Remove-Item -Path $path -Force -Recurse
  }
  else {
    Remove-Item -Path $path
  }
}

function sudo([string] $cmd, $argumet) {
  Start-Process $cmd -Verb runas $argumet
}

function touch([string] $filename) {
  New-Item -Type File $filename | Out-Null
}
