function prompt() {
	$Host.UI.WriteLine($(Get-Location).Path)
	'> '
}

function touch($filename) {
	New-Item -Type File $filename | Out-Null
}
