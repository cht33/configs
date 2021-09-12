#------------------------------- Import Modules BEGIN -------------------------------
# 引入 ps-read-line
Import-Module PSReadLine

# Import-Module PSColor
#------------------------------- Import Modules END   -------------------------------

#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置预测文本来源为历史记录
Set-PSReadLineOption -PredictionSource History

# 每次回溯输入历史，光标定位于输入内容末尾
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 为退出 PowerShell
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit

# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置向上键/<C-p>为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward

# 设置向下键/<C-n>为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward

# 设置<C-f>为接受当前补全提示
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function AcceptSuggestion

# 设置<C-l>为接受下一个补全提示词
Set-PSReadLineKeyHandler -Key "Alt+f" AcceptNextSuggestionWord

# 重定义Rightarrow，处于行尾时为接受下一个补全提示词
Set-PSReadLineKeyHandler -Key RightArrow -ScriptBlock {
       param($key, $arg)

       $line = $null
       $cursor = $null
       [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

       if ($cursor -lt $line.Length) {
           [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
       } else {
           [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
       }
}

#-------------------------------  Set Hot-keys END    -------------------------------

#-------------------------------   Set Alias Begin    -------------------------------
# 4. 打开当前工作目录
function OpenCurrentFolder {
    param
    (
        # 输入要打开的路径
        # 用法示例：open C:\
        # 默认路径：当前工作文件夹
        $Path = '.'
    )
    Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder

# git alias
function Get-GitStatus { & git status -sb $args }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope
function Get-GitDiff { & git diff $args }
New-Alias -Name gd -Value Get-GitDiff -Force -Option AllScope
function Get-GitCommit { & git commit }
New-Alias -Name gco -Value Get-GitCommit -Force -Option AllScope
function Get-GitCommitAmend { & git commit --amend $args }
New-Alias -Name gca -Value Get-GitCommitAmend -Force -Option AllScope
function Get-GitAddAll { & git add --all $args }
New-Alias -Name gaa -Value Get-GitAddAll -Force -Option AllScope
function Get-GitAdd { & git add -- $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope
function Get-GitTree { & git log --graph --oneline --decorate $args }
New-Alias -Name gt -Value Get-GitTree -Force -Option AllScope
function Get-GitPush { & git push --follow-tags $args }
New-Alias -Name gps -Value Get-GitPush -Force -Option AllScope
function Get-GitPullRebase { & git pull $args }
New-Alias -Name gpr -Value Get-GitPullRebase -Force -Option AllScope
function Get-GitFetch { & git fetch $args }
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope
function Get-GitCheckout { & git checkout $args }
New-Alias -Name gch -Value Get-GitCheckout -Force -Option AllScope
function Get-GitCheckoutBranch { & git checkout -b $args }
New-Alias -Name gchb -Value Get-GitCheckoutBranch -Force -Option AllScope
function Get-GitBranch { & git branch $args }
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope
#-------------------------------    Set Alias END     ------------------------------

function prompt {
    $drive = '~'
    if ($pwd.Path -ne $HOME) {
        $drive = "$(Split-Path -path $pwd -Leaf)"
    }
    Write-Host $drive -NoNewline -ForegroundColor Cyan
    $indicator = 0x276F
    Write-Host (" " + [char]::ConvertFromUtf32($indicator)) -NoNewline -ForegroundColor Green
    return " "
}
