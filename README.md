# 安装

## 安装 PowerShell 7

> 支持 PowerShell 7 以上版本

* [https://github.com/PowerShell/PowerShell/releases](https://github.com/PowerShell/PowerShell/releases)

## 安装组件
* [Oh-My-Posh](https://www.powershellgallery.com/packages/oh-my-posh)
```powershell
Install-Module oh-my-posh -Scope CurrentUser -AllowPrerelease
```
* [PSFzf](https://www.powershellgallery.com/packages/PSFzf)
```powershell
Install-Module PSFzf -Scope CurrentUser -AllowPrerelease
```
* [Get-ChildItemColor](https://www.powershellgallery.com/packages/Get-ChildItemColor)
```powershell
Install-Module Get-ChildItemColor -Scope CurrentUser -AllowPrerelease -AllowClobber
```
* [PSReadLine](https://www.powershellgallery.com/packages/PSReadLine)
```powershell
Install-Module PSReadLine -Scope CurrentUser -AllowPrerelease -Force
``` 
* [Posh-Git](https://github.com/dahlbyk/posh-git)
```powershell
Install-Module Posh-Git -Scope CurrentUser -AllowPrerelease
```
* [Scoop](https://scoop.sh)
```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```
* [Git](https://git-scm.com)
* [Fzf](https://github.com/junegunn/fzf)
* [Z.lua](https://github.com/skywind3000/z.lua)
```powershell
scoop install git
scoop install fzf
scoop install lua
scoop install z.lua
```

# 使用

## 快捷键绑定

| 快捷键    | 说明              | Function              |
| --------- | ----------------- | --------------------- |
| ESC       | 进入 Vi 模式      | Vi                    |
| 上箭头    | 向上翻阅历史命令  | HistorySearchBackward |
| 下箭头    | 向下翻阅历史命令  | HistorySearchForward  |
| Ctrl+p    | 向上翻阅历史命令  | HistorySearchBackward |
| Ctrl+n    | 向下翻阅历史命令  | HistorySearchForward  |
| Ctrl+a    | 跳转到行首        | BeginningOfLine       |
| Ctrl+e    | 跳转到行尾        | EndOfLine             |
| Ctrl+f    | 光标向前移动 1 格 | ForwardChar           |
| Ctrl+b    | 光标向后移动 1 格 | BackwardChar          |
| Alt+f     | 跳转到下个单词    | ForwardWord           |
| Alt+b     | 跳转到上个单词    | BackwardWord          |
| Tab       | 补全              | Complete              |
| Shift+Tab | 弹出补全选择列表  | MenuComplete          |

## 查看所有快捷键

```powershell
Get-PSReadLineKeyHandler
```