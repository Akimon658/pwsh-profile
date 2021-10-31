function prompt() {
	Write-Host "`r`n$PWD" -NoNewline -ForegroundColor Green

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

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
