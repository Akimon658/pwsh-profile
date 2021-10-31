function prompt() {
	$branch = git rev-parse --abbrev-ref HEAD

	Write-Host ''
	Write-Host $PWD -NoNewline -ForegroundColor Green
	Write-Host " ($branch)" -ForegroundColor Blue
	Write-Host '$' -NoNewline -Foregroundcolor Green

	return ' '
}

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
