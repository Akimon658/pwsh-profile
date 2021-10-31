function prompt() {
	Write-Host ''

	if (Test-Path .git) {
		Write-Host $PWD -NoNewline -ForegroundColor Green

		$branch = git rev-parse --abbrev-ref HEAD
		Write-Host " ($branch)" -ForegroundColor Blue
	}
	else {
		Write-Host $PWD -ForegroundColor Green
	}

	Write-Host '$' -NoNewline -Foregroundcolor Green

	return ' '
}

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
