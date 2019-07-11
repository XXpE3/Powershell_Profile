$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    $origLastExitCode = $LastExitCode
    Write-VcsStatus

    if (Test-Administrator) {  # if elevated
        Write-Host "(Elevated) " -NoNewline -ForegroundColor DarkGray
    }

    Write-Host "# " -NoNewline -ForegroundColor black
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor DarkBlue
    Write-Host "@" -NoNewline -ForegroundColor black
    Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Yellow
    Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    Write-Host $curPath -NoNewline -ForegroundColor DarkYellow
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor Cyan
    $LastExitCode = $origLastExitCode
    "`n$(' >' * ($nestedPromptLevel + 1)) "
}

Import-Module posh-git

$GitPromptSettings.BeforeStatus = ' [ git:'
$GitPromptSettings.AfterStatus = " ] `n > "

Import-Module Get-ChildItemColor

Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

Import-Module PSReadLine

Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Remove-PSReadlineKeyHandler 'Ctrl+t','Ctrl+r'
Import-Module PSFzf -ArgumentList 'Ctrl+t','Ctrl+r'

function Switch-User
{
    param($Process="powershell.exe")
    $cred = Get-Credential
    Start-Process $Process -Credential $cred  -LoadUserProfile
}