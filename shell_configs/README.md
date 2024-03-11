配置路径：
```
.config
├── aliases
└── zsh
    ├── .zshrc
    └── oh_my_zsh/
```

配置命令:
``` bash
cd ~
cp configs/shell_configs/zsh/.zshenv ~
zsh
mkdir -p $CHT_CONFIG_HOME/zsh
cp configs/shell_configs/zsh/.zshrc $CHT_CONFIG_HOME/zsh/
cp configs/shell_configs/aliases.sh $CHT_CONFIG_HOME
bash configs/shell_configs/zsh/omz_install.sh
cp configs/shell_configs/zsh/cht_agnoster.zsh-theme $ZSH/themes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
