Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt emodipt

Import-Module Get-ChildItemColor

Set-Alias lsc Get-ChildItemColor -option AllScope
Set-Alias lsw Get-ChildItemColorFormatWide -option AllScope

Import-Module PSReadLine

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 5120
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key 'Ctrl+a' -Function BeginningOfLine
Set-PSReadlineKeyHandler -Key 'Ctrl+e' -Function EndOfLine
Set-PSReadlineKeyHandler -key 'Ctrl+f' -Function ForwardChar
Set-PSReadlineKeyHandler -key 'Ctrl+b' -Function BackwardChar
Set-PSReadlineKeyHandler -key 'Alt+f' -Function ForwardWord
Set-PSReadlineKeyHandler -key 'Alt+b' -Function BackwardWord
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function MenuComplete
Set-PSReadlineKeyHandler -Key Tab -Function Complete

Remove-PSReadlineKeyHandler 'Ctrl+t','Ctrl+r'
Import-Module PSFzf -ArgumentList 'Ctrl+t','Ctrl+r'

function Switch-User
{
    param($Process="powershell.exe")
    $cred = Get-Credential
    Start-Process $Process -Credential $cred  -LoadUserProfile
}

Invoke-Expression (& { (lua C:\Users\$env:UserName\scoop\apps\z.lua\1.8.12\z.lua --init powershell) -join "`n" })