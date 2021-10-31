function prompt() {
	Write-Host $PWD -ForegroundColor Green
	'$ '
}

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
