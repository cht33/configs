#------------------------------- Import Modules BEGIN -------------------------------
# 引入 ps-read-line
Import-Module PSReadLine
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

# 设置向上键/<C-k>为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function HistorySearchBackward

# 设置向下键/<C-j>为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "Ctrl+j" -Function HistorySearchForward

# 设置<C-l>为接受当前补全提示
Set-PSReadLineKeyHandler -Key "Ctrl+l" -Function AcceptSuggestion
#-------------------------------  Set Hot-keys END    -------------------------------

#-------------------------------   Set Alias Begin    -------------------------------
# 3. 查看目录 ls & ll
function ListFileNames($param='cht') {
    $list = Get-ChildItem
    foreach($t in $list) {
        if ($param[0] -eq 'a') {
            write-host ("{0}  {1,10:d} {1,5:t}  " -f $t.mode, $t.LastWriteTime) -NoNewline
        }
        if ($t.mode[0] -eq 'd') {
            write-host $t.Name -ForegroundColor DarkBlue
        } else {
            write-host $t.Name
        }
    }
}
function ListAll {ListFileNames -param 'a'}
Set-Alias -Name ls -Value ListFileNames
Set-Alias -Name ll -Value ListAll

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
