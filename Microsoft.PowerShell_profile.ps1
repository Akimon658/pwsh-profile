function prompt() {
	Write-Host $PWD -ForegroundColor Green
	Write-Host '$' -NoNewline -Foregroundcolor Green

	return ' '
}

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
