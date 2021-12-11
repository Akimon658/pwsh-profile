function prompt() {
	$currentDir = (Convert-Path .)

	if ($currentDir.Contains($HOME)) {
		$currentDir = $currentDir.Replace($HOME, "~")
	}

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

Set-Alias ls list
function list() {
	Get-ChildItem -Name
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
