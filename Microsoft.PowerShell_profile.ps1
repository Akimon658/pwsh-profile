function prompt() {
	$currentDir = (Convert-Path .)

	if ($currentDir.Contains($HOME)) {
		$currentDir = $currentDir.Replace($HOME, "~")
	}
	$currentDir = $currentDir.Replace("\", "/")

	Write-Host "$currentDir" -NoNewline -ForegroundColor Green

	if (Test-Path .git) {
		$branch = git rev-parse --abbrev-ref HEAD
		Write-Host " ($branch)" -ForegroundColor Blue
	}
	else {
		Write-Host "`r"
	}

	Write-Host '$' -NoNewline -Foregroundcolor White

	return ' '
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
function list([string] $path) {
	Get-ChildItem $path -Name
}

Set-Alias mkdir makeDir
function makeDir([string] $dir) {
	if (Test-Path $dir) {
		Write-Host "`r`n$dir already exists" -ForegroundColor Red
	}
	else {
		New-Item -ItemType Directory -Force -Path $dir | Out-Null
	}
}

function sudo([string] $cmd, $argumet) {
	Start-Process $cmd -Verb runas $argumet
}

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
