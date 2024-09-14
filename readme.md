# AutoHotkey Script for system wide vim navigation

This repository contains an AutoHotkey script that enhances your keyboard functionality by implementing Vim-like navigation and editing commands system-wide, along with additional useful shortcuts.

This script is inspired by and adapted from:

- The [Karabiner-Elements Vim Mode Plus](https://ke-complex-modifications.pqrs.org/#vim_mode_plus_better_notifications) plugin for Mac, developed by [harmtemolder](https://git.sr.ht/~harmtemolder/karabiner-vim-mode-plus).
- The [Karabiner-Elements Shortcut (Delete and Enter)](https://ke-complex-modifications.pqrs.org/#shortcut_delete_and_enter) complex modifications for Karabiner-Elements.

## Requirements

1. Windows operating system
2. [AutoHotkey](https://www.autohotkey.com/) installed (v1.1)

## Installation

1. Clone this repository or download the script file.
2. Ensure AutoHotkey is installed on your system.
3. Double-click the `system_wide_vim.ahk` file to run it.

## Usage

### Vim Mode

Toggle Vim mode on/off with the CapsLock key. When in Vim mode, the following commands are available:

#### Navigation
1. `h`: Left
2. `l`: Right
3. `k`: Up
4. `j`: Down
5. `w`: Word forward
6. `W`: Select Word forward 
7. `e`: Word forward
8. `E`: Select Word forward
9. `b`: Word backward
10. `B`: Select Word backward
11. `0`: Start of line
12. `$`: End of line
13. `^`: First non-blank character of line
14. `gg`: Top of file
15. `G`: Bottom of file

These commands will support d(delete operator), c(change operator) and v (visual mode)

#### Editing
1. `x`: Delete character
2. `X`: Backspace
3. `d`: Delete (operator)
4. `c`: Change (operator)
5. `y`: Yank/Copy (operator)
6. `p`: Paste

#### Undo/Redo
1. `u`: Undo
2. `Ctrl + r`: Redo

#### Modes
1. `v`: Toggle Visual mode
2. `i`: Insert mode (at cursor)
3. `I`: Insert mode (start of line)
4. `a`: Insert mode (after cursor)
5. `A`: Insert mode (end of line)
6. `o`: Insert mode (new line below)
7. `O`: Insert mode (new line above)

### Additional Shortcuts

These shortcuts are always active, regardless of Vim mode:

1. Double-tap Right `Shift`: Toggle Caps Lock
2. `Left Ctrl + Shift + "`: New Line
3. `Left Ctrl + ;`: Backspace
4. `Left Ctrl + Shift + ;`: Delete
5. `Left Ctrl + '`: Enter
6. `Shift + Caps Lock`: Esc

## Customization

You can modify this script to suit your needs. Open the `.ahk` file in a text editor to make changes. Refer to the [AutoHotkey documentation](https://www.autohotkey.com/docs/AutoHotkey.htm) for guidance on syntax and available commands.

## Troubleshooting

1. If the script doesn't work, ensure AutoHotkey is installed correctly.
2. Some applications may block AutoHotkey scripts. You may need to run the script as administrator or add exceptions in your security software.
3. If you encounter conflicts with existing shortcuts, modify the script or adjust your system's keyboard settings.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgements

- This script was created with the help of cloude.ai
- The Vim mode functionality is inspired by the [Vim Mode Plus](https://ke-complex-modifications.pqrs.org/#vim_mode_plus_better_notifications) plugin for Mac, developed by [harmtemolder](https://git.sr.ht/~harmtemolder/karabiner-vim-mode-plus). You can find the original implementation at https://git.sr.ht/~harmtemolder/karabiner-vim-mode-plus.
- The additional shortcuts are inspired by the [Shortcut (Delete and Enter)](https://ke-complex-modifications.pqrs.org/#shortcut_delete_and_enter) complex modifications for Karabiner-Elements.