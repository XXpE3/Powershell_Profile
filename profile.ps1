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

    Write-Host "# " -NoNewline -ForegroundColor DarkYellow
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor DarkYellow
    Write-Host "@" -NoNewline -ForegroundColor DarkCyan
    Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Red
    Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    Write-Host $curPath -NoNewline -ForegroundColor Yellow
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor Green
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    $LastExitCode = $origLastExitCode
    "`n$('>' * ($nestedPromptLevel + 1)) "
}

Import-Module posh-git

$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText  = '] '

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

Function h+
{
    Get-History |
        Out-GridView -Title "Command History - press CTRL to select multiple - Selected commands copied to clipboard" -OutputMode Multiple |
        ForEach-Object -Begin { [Text.StringBuilder]$sb = ""} -Process { $null = $sb.AppendLine($_.CommandLine) } -End { $sb.ToString() | clip }
}

Remove-PSReadlineKeyHandler 'Ctrl+T','Ctrl+R'
Import-Module PSFzf -ArgumentList 'Ctrl+T','Ctrl+R'