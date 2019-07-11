特性

* Emacs 键位配置
* Git 状态显示
* 目录文件彩色输出
* 历史命令与文件快速搜索
* 图形化历史命令记录

组件

* [PSFzf](https://www.powershellgallery.com/packages/PSFzf/1.1.19)
```
Install-Module -Name PSFzf
```
* [Get-ChildItemColor](https://www.powershellgallery.com/packages/Get-ChildItemColor/1.2.3)
```
Install-Module -Name Get-ChildItemColor
```
* [PSReadLine](https://www.powershellgallery.com/packages/PSReadLine/2.0.0-beta3)
```
Install-Module -Name PSReadLine
```
* [Posh-Git](https://github.com/dahlbyk/posh-git)
```
PowerShellGet\Install-Module posh-git
```
* [Chocolatey](https://chocolatey.org/)
```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
* [Fzf](https://github.com/junegunn/fzf)
```
choco install fzf
```