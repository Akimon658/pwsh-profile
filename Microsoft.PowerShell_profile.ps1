oh-my-posh init pwsh --config '~\AppData\Local\Programs\oh-my-posh\themes\kushal.omp.json' | Invoke-Expression

function onViModeChange
{
  if ($args[0] -eq 'Command')
  {
    Write-Host -NoNewline "`e[1 q"
  } else
  {
    Write-Host -NoNewline "`e[5 q"
  }
}

Set-PSReadLineOption -EditMode Vi -ViModeIndicator Script -ViModeChangeHandler $Function:onViModeChange
# Ctrl+[ doesn't work so using Oem4 (PowerShell/PSReadLine#906)
Set-PSReadLineKeyHandler -Chord Ctrl+Oem4 -Function ViCommandMode
Set-PSReadLineKeyHandler -Chord Ctrl+h -Function BackwardDeleteChar
Set-PSReadLineKeyHandler -Chord Ctrl+m -Function AcceptLine
Set-PSReadLineKeyHandler -Chord Ctrl+m -Function AcceptLine -ViMode Command
Set-PSReadLineKeyHandler -Chord Ctrl+w -Function BackwardKillWord

Remove-Item Alias:* -Force

New-Alias -Name cd -Value Set-Location

function mkdir
{
  mkdir.exe $args
}
