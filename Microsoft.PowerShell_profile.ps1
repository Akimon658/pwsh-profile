function prompt() {
	$Host.UI.WriteLine($(Get-Location).Path)
	'> '
}

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
