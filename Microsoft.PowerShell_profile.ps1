function prompt() {
	$Host.UI.WriteLine($PWD)
	'$ '
}

function touch([string] $filename) {
	New-Item -Type File $filename | Out-Null
}
