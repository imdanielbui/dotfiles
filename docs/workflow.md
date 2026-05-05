# Developer Workflow Guide

## Mục lục

1. [Khởi động hệ thống](#1-khởi-động-hệ-thống)
2. [Kitty Terminal](#2-kitty-terminal)
3. [Tmux](#3-tmux)
4. [Neovim](#4-neovim)
5. [Tmux-Nvim Navigation](#5-tmux-nvim-navigation)
6. [Dart/Flutter Workflow](#6-dartflutter-workflow)
7. [JavaScript/TypeScript Workflow](#7-javascripttypescript-workflow)
8. [Quick Reference](#8-quick-reference)

---

## 1. Khởi động hệ thống

### 1.1 Mở Terminal

1. Mở **Kitty** (đã cấu hình với theme Catppuccin Mocha)
2. Gõ `tmux` để khởi động tmux session (hoặc `tmux attach` nếu có session cũ)

### 1.2 Kiểm tra Plugins đã cài đặt chưa

**Trong Neovim:**
```vim
:PackerSync    " Chạy lệnh này trong nvim để cài/ update plugins
```

**Trong Tmux:**
- Bấm `Ctrl+s` (prefix default) rồi bấm `I` (capital i) để cài TPM plugins
- Cần có: `vim-tmux-navigator` (đã config trong `.tmux.conf`)

### 1.3 Kiểm tra LSP hoạt động

Mở file `.dart` hoặc `.js` trong nvim, chạy:
```vim
:LspInfo    " Xem LSP status
```

---

## 2. Kitty Terminal

### 2.1 Cơ bản

| Action | Shortcut |
|--------|----------|
| Mở terminal mới | `Ctrl+Shift+Enter` |
| Đóng tab | `Ctrl+Shift+w` |
| Chuyển tab | `Ctrl+Shift+[` hoặc `Ctrl+Shift+]` |
| Tạo tab mới | `Ctrl+Shift+t` |
| Đổi tên tab | `Ctrl+Shift+Alt+p` |
| Zoom toàn màn hình | `Ctrl+Shift+z` |
| Thoát fullscreen | `Esc` |
| Copy text | `Ctrl+Shift+c` |
| Paste text | `Ctrl+Shift+v` |
| Tìm trong terminal | `Ctrl+Shift+f` |
| Chỉnh cỡ chữ | `Ctrl++` / `Ctrl+-` |

### 2.2 Window Management

| Action | Shortcut |
|--------|----------|
| Split ngang | `Ctrl+Shift+Enter` |
| Split dọc | `Ctrl+Shift+v` (sau khi đã split) |
| Di chuyển giữa các split | `Ctrl+Shift+h/j/k/l` |
| Đóng split | `Ctrl+Shift+x` |
| Tile all windows | `Ctrl+Shift+l` |
| Stack all windows | `Ctrl+Shift+y` |

### 2.3 Copy/Paste với Clipboard

```bash
# Copy ra clipboard hệ thống
Ctrl+Shift+c    " Trong kitty

# Paste từ clipboard hệ thống
Ctrl+Shift+v    " Trong kitty

# Trong tmux (sử dụng tmux buffer)
Ctrl+s + y      " Copy vào tmux buffer
Ctrl+s + p      " Paste từ tmux buffer
```

### 2.4 Tìm kiếm và URL

```bash
# Click vào URL để mở trong browser
Ctrl+Shift+click on URL

# Mở link dưới con trỏ
Ctrl+Shift+o
```

---

## 3. Tmux

### 3.1 Cấu trúc Tmux

```
Session (1 phiên làm việc)
  ├── Window 1 (Tab 1)
  │     ├── Pane 1 (Split ngang/dọc)
  │     └── Pane 2
  ├── Window 2 (Tab 2)
  └── Window 3 (Tab 3)
```

### 3.2 Prefix

**Prefix mặc định:** `Ctrl+s` (đã config trong tmux.conf)

Mọi lệnh tmux đều bắt đầu bằng prefix.

### 3.3 Session Management

| Action | Command | Description |
|--------|---------|-------------|
| Tạo session mới | `tmux new -s <tên>` | Tạo session với tên |
| Liệt kê session | `tmux ls` | Xem tất cả session |
| Attach vào session | `tmux a -t <tên>` | Vào lại session cũ |
| Đổi tên session | `Ctrl+s + $` | Đổi tên session hiện tại |
| Detach khỏi session | `Ctrl+s + d` | Thoát tmux nhưng giữ session |
| Kill session | `tmux kill-session -t <tên>` | Xóa session |

**Ví dụ:**
```bash
tmux new -s dev       # Tạo session tên "dev"
tmux a                # Attach vào session cuối cùng
tmux a -t dev         # Attach vào session tên "dev"
```

### 3.4 Window Management (Tab)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Tạo window mới | `Ctrl+s + c` | Tạo tab mới |
| Đổi tên window | `Ctrl+s + ,` | Đặt tên cho tab hiện tại |
| Liệt kê windows | `Ctrl+s + w` | Xem tất cả tabs |
| Chuyển window | `Ctrl+s + <0-9>` | Qua tab số 0-9 |
| Window trước | `Ctrl+s + p` | Tab trước |
| Window sau | `Ctrl+s + n` | Tab kế tiếp |
| Tìm window | `Ctrl+s + f` | Tìm tab theo tên |
| Đóng window | `Ctrl+s + &` | Xóa tab hiện tại |

### 3.5 Pane Management (Split)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Split dọc | `Ctrl+s + "` | Chia màn hình theo chiều dọc |
| Split ngang | `Ctrl+s + %` | Chia màn hình theo chiều ngang |
| Đóng pane | `Ctrl+s + x` | Đóng split hiện tại |
| Di chuyển pane | `Ctrl+s + o` | Qua pane tiếp theo |
| Di chuyển pane (vim style) | `Ctrl+s + h/j/k/l` | Qua pane theo hướng |
| Resize pane | `Ctrl+s + Alt+h/j/k/l` | Thay đổi kích thước |
| Zoom pane | `Ctrl+s + z` | Phóng to pane hiện tại |
| Tile all panes | `Ctrl+s + E` | Sắp xếp lại tất cả |
| Swap pane | `Ctrl+s + {` | Đổi vị trí pane trước |
| Swap pane | `Ctrl+s + }` | Đổi vị trí pane sau |

### 3.6 Copy Mode (Scrollback)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Vào copy mode | `Ctrl+s + [` | Bắt đầu scroll |
| Di chuyển | `h/j/k/l` hoặc arrows | Như vim |
| Tìm kiếm | `/` hoặc `?` | Tìm text |
| Bắt đầu selection | `v` | Bắt đầu chọn text |
| Selection to line | `V` | Chọn cả dòng |
| Copy selection | `y` | Copy vào tmux buffer |
| Paste | `Ctrl+s + ]` | Paste từ buffer |
| Thoát | `q` | Thoát copy mode |

### 3.7 Các lệnh hữu ích khác

| Action | Shortcut | Description |
|--------|----------|-------------|
| Xem keybindings | `Ctrl+s + ?` | Liệt kế tất cả shortcuts |
| Clock mode | `Ctrl+s + t` | Hiển thị đồng hồ |
| Command prompt | `Ctrl+s + :` | Nhập lệnh tmux |

---

## 4. Neovim

### 4.1 Cấu trúc thư mục

```
~/.config/nvim/           " Symlink -> ~/dotfiles/nvim/.config/nvim/
├── init.lua              " Entry point
├── lazy-lock.json        " Plugin lock file
├── lua/
│   ├── plugins.lua       " Plugin specs (Packer)
│   ├── lsp.lua           " LSP configurations
│   ├── options.lua       " Vim options
│   ├── keymaps.lua       " Keybindings
│   ├── autocmds.lua      " Auto commands
│   ├── globals.lua       " Global variables
│   ├── ui.lua            " UI settings
│   └── config/           " Plugin configs
│       ├── lualine.lua
│       ├── bufferline.lua
│       ├── nvim-tree.lua
│       ├── telescope.lua
│       ├── nvim-cmp.lua
│       └── ...
```

### 4.2 Basic Navigation

| Action | Shortcut | Description |
|--------|----------|-------------|
| Di chuyển | `h/j/k/l` | Left/Down/Up/Right |
| Đầu dòng | `0` | Đầu dòng |
| Đầu dòng (non-blank) | `^` | Đầu dòng (bỏ qua khoảng trắng) |
| Cuối dòng | `$` | Cuối dòng |
| Đầu file | `gg` | Dòng đầu tiên |
| Cuối file | `G` | Dòng cuối cùng |
| Xuống dòng N | `<N>G` | Đến dòng N |
| Word forward | `w` | Từ tiếp theo |
| Word back | `b` | Tờ trước |
| Word end | `e` | Cuối từ |
| Find char | `f<char>` | Tìm ký tự trong dòng |
| Find char back | `F<char>` | Tìm ngược |
| To char | `t<char>` | Đến trước ký tự |
| To char back | `T<char>` | Đến sau ký tự |

### 4.3 Insert Mode

| Action | Shortcut | Description |
|--------|----------|-------------|
| Insert before cursor | `i` | Vào mode chèn |
| Insert at line start | `I` | Chèn đầu dòng |
| Append after cursor | `a` | Chèn sau con trỏ |
| Append at line end | `A` | Chèn cuối dòng |
| New line below | `o` | Tạo dòng mới bên dưới |
| New line above | `O` | Tạo dòng mới bên trên |
| Thoát insert mode | `Esc` hoặc `jj` | Về normal mode |

### 4.4 Visual Mode

| Action | Shortcut | Description |
|--------|----------|-------------|
| Visual mode | `v` | Chọn text |
| Visual line | `V` | Chọn theo dòng |
| Visual block | `Ctrl+v` | Chọn khối |
| Chọn all | `ggVG` | Chọn toàn bộ file |
| Copy (yank) | `y` | Copy selection |
| Cut | `d` | Cut selection |
| Paste | `p` | Paste sau con trỏ |
| Paste before | `P` | Paste trước con trỏ |

### 4.5 Editing

| Action | Shortcut | Description |
|--------|----------|-------------|
| Undo | `u` | Lùi lại |
| Redo | `Ctrl+r` | Tiến tới |
| Delete char | `x` | Xóa ký tự |
| Delete word | `dw` | Xóa từ |
| Delete to end | `D` hoặc `d$` | Xóa đến cuối dòng |
| Delete line | `dd` | Xóa dòng |
| Delete N lines | `<N>dd` | Xóa N dòng |
| Change word | `cw` | Thay từ |
| Change line | `cc` | Thay dòng |
| Replace char | `r<char>` | Thay 1 ký tự |
| Replace mode | `R` | Replace nhiều ký tự |
| Join lines | `J` | Nối dòng dưới |

### 4.6 Register (Clipboard)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Yank (copy) | `y` | Copy vào register |
| Paste | `p` | Paste từ register mặc định |
| Paste from register a | `"ap` | Paste từ register a |
| Yank to register a | `"ay` | Copy vào register a |
| Xem registers | `:reg` | Xem tất cả registers |

### 4.7 File Operations

| Action | Shortcut | Description |
|--------|----------|-------------|
| Save | `:w` | Lưu file |
| Save & quit | `:wq` hoặc `ZZ` | Lưu và thoát |
| Quit | `:q` | Thoát (nếu không thay đổi) |
| Quit without save | `:q!` hoặc `ZQ` | Thoát không lưu |
| Save all | `:wa` | Lưu tất cả |
| Open file | `:e <path>` | Mở file |
| Open file (split) | `:sp <path>` | Mở file (split ngang) |
| Open file (vsplit) | `:vsp <path>` | Mở file (split dọc) |
| Reload file | `:e` | Reload file hiện tại |
| Write | `:w <path>` | Lưu sang file mới |

### 4.8 Windows/Splits

| Action | Shortcut | Description |
|--------|----------|-------------|
| Split horizontal | `:sp` | Chia màn hình ngang |
| Split vertical | `:vsp` | Chia màn hình dọc |
| Split (new file) | `:new` | Tạo window trống |
| Close window | `:q` hoặc `Ctrl+w c` | Đóng split hiện tại |
| Move to left | `Ctrl+w h` | Di chuyển sang trái |
| Move to right | `Ctrl+w l` | Di chuyển sang phải |
| Move to up | `Ctrl+w k` | Di chuyển lên trên |
| Move to down | `Ctrl+w j` | Di chuyển xuống dưới |
| Rotate windows | `Ctrl+w r` | Xoay vòng windows |
| Equal size | `Ctrl+w =` | Cân bằng kích thước |
| Maximize | `Ctrl+w _` | Phóng to window |
| Height + | `Ctrl+w +` | Tăng chiều cao |
| Height - | `Ctrl+w -` | Giảm chiều cao |

### 4.9 Tabs

| Action | Shortcut | Description |
|--------|----------|-------------|
| New tab | `:tabnew` hoặc `:tabe` | Tạo tab mới |
| Open file in tab | `:tabnew <path>` | Mở file trong tab mới |
| Close tab | `:tabc` | Đóng tab |
| Next tab | `:tabn` hoặc `gt` | Tab tiếp theo |
| Previous tab | `:tabp` hoặc `gT` | Tab trước |
| Go to tab N | `<N>gt` | Đến tab số N |
| Move tab | `:tabmove <N>` | Di chuyển tab |

### 4.10 Search and Replace

| Action | Shortcut | Description |
|--------|----------|-------------|
| Search forward | `/<pattern>` | Tìm kiếm xuôi |
| Search backward | `?<pattern>` | Tìm kiếm ngược |
| Next match | `n` | Kết quả tiếp theo |
| Previous match | `N` | Kết quả trước |
| Search in selection | `:S/<pattern>` | Tìm trong vùng chọn |
| Replace all | `:%s/old/new/g` | Thay thế tất cả |
| Replace with confirm | `:%s/old/new/gc` | Thay thế có hỏi |
| Replace in selection | `:S/old/new/g` | Thay trong vùng chọn |

### 4.11 Fuzzy Finder (Telescope)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Find files | `Ctrl+p` | Tìm file trong project |
| Find files (hidden) | `Ctrl+Shift+p` | Bao gồm hidden files |
| Live grep | `Ctrl+g` hoặc `Ctrl+Shift+f` | Tìm trong file content |
| Find buffers | `Ctrl+b` | Tìm trong các buffer đang mở |
| Find recent files | `Ctrl+o` | File gần đây |
| Find help | `Ctrl+h` | Tìm trong help |
| Find keymaps | `Ctrl+k` | Tìm keybindings |
| Find man | `Ctrl+m` | Tìm trong man pages |
| Find colorscheme | `Ctrl+t c` | Xem colorschemes |
| Grep visual selection | `:` rồi `'<,'> Telescope live_grep` | Tìm trong selection |

**Telescope keybindings trong picker:**
| Key | Action |
|-----|--------|
| `Enter` | Open file |
| `Ctrl+v` | Open vertical split |
| `Ctrl+x` | Open horizontal split |
| `Ctrl+t` | Open in new tab |
| `Tab` | Toggle selection |
| `q` | Quit |
| `j/k` | Navigate up/down |
| `Esc` | Cancel |

### 4.12 File Explorer (NvimTree)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Toggle explorer | `Ctrl+n` | Mở/đóng file tree |
| Open file | `Enter` | Mở file |
| Open in split | `v` | Mở vertical split |
| Open in vsplit | `h` | Mở horizontal split |
| Open in tab | `t` | Mở trong tab mới |
| Open in preview | `P` | Preview (không mở) |
| Navigate up | `-` | Lên thư mục cha |
| Create file | `a` | Tạo file mới |
| Create folder | `ma` | Tạo thư mục mới |
| Rename | `r` | Đổi tên |
| Delete | `d` | Xóa |
| Cut | `x` | Cut vào clipboard |
| Copy | `c` | Copy vào clipboard |
| Paste | `p` | Paste từ clipboard |
| Refresh | `R` | Refresh tree |
| Toggle hidden | `H` | Ẩn/hiện hidden files |
| Toggle dotfiles | `I` | Ẩn/hiện gitignore |
| Filter | `f` | Lọc file |

### 4.13 Jump to Definition (LSP)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Go to definition | `gd` | Nhảy đến definition |
| Declarations | `gD` | Xem declarations |
| Implementations | `gI` | Xem implementations |
| Type definition | `gT` | Xem type definition |
| References | `gr` | Xem references (fzf) |
| Hover | `K` hoặc `Shift+K` | Xem documentation |
| Signature help | `Ctrl+k` | Xem function signature |
| Rename | `cr` (trong visual) | Đổi tên symbol |
| Code action | `ca` | Xem suggested actions |
| Format code | `gq` | Format code |

### 4.14 LSP Diagnostics

| Action | Shortcut | Description |
|--------|----------|-------------|
| Next error | `]e` | Lỗi tiếp theo |
| Previous error | `[e` | Lỗi trước đó |
| Next warning | `]w` | Warning tiếp theo |
| Previous warning | `[w` | Warning trước đó |
| All errors | `:LspDiagnostics` | Xem tất cả |

### 4.15 Git Integration (Gitsigns)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Next hunk | `]c` | Thay đổi tiếp theo |
| Previous hunk | `[c` | Thay đổi trước đó |
| Stage hunk | `hs` | Stage thay đổi |
| Unstage hunk | `hu` | Unstage thay đổi |
| Stage buffer | `hS` | Stage toàn bộ file |
| Unstage buffer | `hU` | Unstage toàn bộ file |
| Preview hunk | `hp` | Xem thay đổi |
| Blame line | `hb` | Xem ai viết dòng này |
| Diff buffer | `hd` | Xem diff của file |
| Toggle deleted | `hD` | Hiện/ẩn deleted lines |

### 4.16 Hop (Quick Jump)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Word jump | `s` | Nhảy đến bất kỳ word nào |
| Line jump | `gh` | Nhảy đến bất kỳ line nào |
| 2-char jump | `f` | Nhảy đến 2 ký tự |
| Easy motion | `gs` | Easy motion mode |

### 4.17 Autocomplete (nvim-cmp)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Trigger completion | `Ctrl+Space` | Bật autocomplete |
| Select suggestion | `j/k` hoặc `Down/Up` | Chọn suggestion |
| Confirm | `Enter` hoặc `Ctrl+y` | Xác nhận |
| Cancel | `Esc` hoặc `Ctrl+e` | Hủy |
| Next suggestion | `Ctrl+j` hoặc `Tab` | Tiếp theo |
| Previous suggestion | `Ctrl+k` hoặc `Shift+Tab` | Trước đó |
| Scroll docs up | `Ctrl+u` | Scroll documentation lên |
| Scroll docs down | `Ctrl+d` | Scroll documentation xuống |

### 4.18 Which Key (Keybindings popup)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Show keybindings | `Space` | Xem all keybindings |
| Show filetype actions | `;` | Xem file actions |
| Show window actions | `Ctrl+w` | Xem window actions |

### 4.19 Bufferline (Tabs trong nvim)

| Action | Shortcut | Description |
|--------|----------|-------------|
| Next buffer | `]b` | Tab tiếp theo |
| Previous buffer | `[b` | Tab trước |
| Close buffer | `bd` | Đóng buffer hiện tại |
| Close others | `bo` | Đóng các buffer khác |
| Buffer list | `bl` | Xem danh sách buffer |

### 4.20 Miscellaneous

| Action | Shortcut | Description |
|--------|----------|-------------|
| Command mode | `:` | Vào command mode |
| Repeat last command | `@@` | Lặp lại command |
| Increment number | `Ctrl+a` | Tăng số |
| Decrement number | `Ctrl+x` | Giảm số |
| Toggle case | `~` | Đổi hoa/thường |
| Upper line | `gUU` | Viết hoa dòng |
| Lower line | `guu` | Viết thường dòng |
| Word upper | `gUiw` | Viết hoa từ |
| Word lower | `guiw` | Viết thường từ |
| Indent | `>>` | Thụt lề |
| Outdent | `<<` | Bớt thụt lề |
| Indent visual | `>` | Thụt lề vùng chọn |
| Outdent visual | `<` | Bớt thụt lề vùng chọn |

---

## 5. Tmux-Nvim Navigation

Đây là tính năng quan trọng nhất - cho phép di chuyển liên tục giữa **tmux panes** và **nvim splits**.

### 5.1 Keybindings

| Action | Shortcut | Description |
|--------|----------|-------------|
| Move left | `Ctrl+h` | Qua split/pane bên trái |
| Move right | `Ctrl+l` | Qua split/pane bên phải |
| Move up | `Ctrl+k` | Qua split/pane bên trên |
| Move down | `Ctrl+j` | Qua split/pane bên dưới |

### 5.2 Cách hoạt động

1. **Trong nvim:** Bấm `Ctrl+h` sẽ qua nvim split bên trái. Nếu không có split nào bên trái, nó sẽ **nhảy sang tmux pane bên trái**.

2. **Trong tmux:** Bấm `Ctrl+h` sẽ qua tmux pane bên trái. Nếu không có pane nào bên trái, nó sẽ **nhảy sang nvim split bên phải** (nếu đang ở trong nvim).

### 5.3 Workflow thực tế

**Ví dụ:** Bạn có 3 panes:
```
+------------------+------------------+
|     nvim (split) |     nvim (split) |  <- Pane 1 (tmux)
+------------------+------------------+
|         terminal |                  |  <- Pane 2 (tmux)
+------------------+------------------+
```

1. Mở nvim, bấm `:sp` để tạo 2 splits
2. Bấm `Ctrl+l` để qua split bên phải
3. Bấm `Ctrl+l` lần nữa - sẽ nhảy sang terminal bên cạnh
4. Trong terminal, bấm `Ctrl+h` - sẽ quay lại nvim split bên trái

### 5.4 Cài đặt

**Đã config sẵn trong:**
- `~/dotfiles/nvim/.config/nvim/lua/plugins.lua` (plugin vim-tmux-navigator)
- `~/dotfiles/tmux/.config/tmux/tmux.conf` (TPM plugin)

**Kiểm tra đã cài chưa:**
```bash
# Trong tmux
Ctrl+s I     # Cài đặt TPM plugins
```

### 5.5 Lưu ý quan trọng

- Khi di chuyển sang tmux pane, bạn vẫn ở trong tmux (không phải nvim)
- Khi di chuyển sang nvim split, bạn tự động vào nvim (vim-tmux-navigator sẽ focus vào nvim)
- **Không cần bấm prefix (`Ctrl+s`) khi dùng navigation này!**

---

## 6. Dart/Flutter Workflow

### 6.1 LSP Configuration

**Đã config trong:** `~/dotfiles/nvim/.config/nvim/lua/lsp.lua`

```lua
-- Dart LSP (dartls)
require('lspconfig').dartls.setup {
  cmd = {'dart', 'language-server'},
  root_pattern = {'pubspec.yaml', '.dart_tool'},
  settings = {
    dart = {
      completeFunctionCalls = true,
      showIncomingExports = true,
    }
  }
}
```

### 6.2 Dart/Flutter Commands

| Action | Command | Description |
|--------|---------|-------------|
| Run Dart | `dart run` | Chạy file Dart |
| Run Flutter | `flutter run` | Chạy app Flutter |
| Format code | `gq` hoặc `:DartFormat` | Format code |
| Analyze | `flutter analyze` | Kiểm tra lỗi |
| Get packages | `flutter pub get` | Tải dependencies |
| Create project | `flutter create <name>` | Tạo project mới |
| Build APK | `flutter build apk` | Build APK |
| Build iOS | `flutter build ios` | Build iOS |

### 6.3 LSP Features trong Dart

| Feature | Shortcut | Description |
|---------|----------|-------------|
| Go to definition | `gd` | Nhảy đến class/function definition |
| Find references | `gr` | Tìm tất cả references |
| Hover | `Shift+K` | Xem documentation |
| Rename | `cr` | Đổi tên symbol |
| Code actions | `ca` | Suggested fixes |
| Complete | `Ctrl+Space` | Autocomplete |

### 6.4 Treesitter

**Đã cài:** dart treesitter parser

Tự động highlight code trong các file `.dart`.

### 6.5 Snippets

Sử dụng nvim-cmp với snippets cho Dart:
- `stful` - StatefulWidget
- `stless` - StatelessWidget
- `init` - main() function

### 6.6 Ví dụ workflow

**Tạo Flutter app mới:**
```bash
# Trong terminal (tmux)
flutter create my_app
cd my_app
flutter pub get

# Mở trong nvim
nvim lib/main.dart
```

**Làm việc với code:**
1. `Ctrl+p` để tìm file
2. `gd` để nhảy đến definition
3. `gr` để tìm references
4. `gq` để format code
5. `:flutter run` để chạy app

---

## 7. JavaScript/TypeScript Workflow

### 7.1 LSP Configuration

**Đã config trong:** `~/dotfiles/nvim/.config/nvim/lua/lsp.lua`

- **ts_ls** - TypeScript/JavaScript (cài qua `npm install -g typescript-language-server`)
- **tailwindcss** - Tailwind CSS (cài qua `npm install -g tailwindcss-language-server`)
- **emmet_ls** - Emmet completions

### 7.2 JS/TS Commands

| Action | Command | Description |
|--------|---------|-------------|
| Install deps | `npm install` | Tải node_modules |
| Run script | `npm run <script>` | Chạy npm script |
| Dev server | `npm run dev` | Chạy dev server |
| Build | `npm run build` | Build production |
| Type check | `npx tsc --noEmit` | Check TypeScript |
| Format | `npx prettier --write .` | Format code |

### 7.3 LSP Features trong JS/TS

| Feature | Shortcut | Description |
|---------|----------|-------------|
| Go to definition | `gd` | Nhảy đến definition |
| Find references | `gr` | Tìm tất cả references |
| Hover | `Shift+K` | Xem type/documentation |
| Rename | `cr` | Rename symbol |
| Code actions | `ca` | Fix/Suggestions |
| Complete | `Ctrl+Space` | Autocomplete |

### 7.4 Nvim-Cmp với JS/TS

- Tự động gợi ý từ LSP
- Snippets: if, for, function, arrow function, etc.
- Path completion cho imports

### 7.5 TSLint/ESLint

Đã config với **none-ls** (null-ls) nếu cần:
- ESLint diagnostics
- Prettier formatting

### 7.6 Ví dụ workflow

**Mở project:**
```bash
# Trong terminal
cd my-project
npm install

# Mở trong nvim
nvim src/index.ts
```

**Làm việc:**
1. `Ctrl+p` - Tìm file
2. `Ctrl+g` - Tìm trong code
3. `gd` - Go to definition
4. `gq` - Format code
5. `ca` - Xem suggested fixes

---

## 8. Quick Reference

### 8.1 Khởi động buổi làm việc

```bash
# 1. Mở Kitty
# 2. Khởi tmux
tmux

# 3. (Lần đầu) Cài tmux plugins
Ctrl+s I

# 4. Mở nvim
nvim

# 5. (Lần đầu) Cài nvim plugins
:PackerSync
```

### 8.2 Shortcuts quan trọng nhất

| Context | Shortcut | Ý nghĩa |
|---------|----------|----------|
| Nvim | `Ctrl+h/j/k/l` | Di chuyển (tmux-nvim) |
| Nvim | `Ctrl+p` | Tìm file |
| Nvim | `Ctrl+g` | Tìm trong code |
| Nvim | `Space` | Show keybindings |
| Nvim | `Ctrl+n` | Toggle file tree |
| Nvim | `gd` | Go to definition |
| Nvim | `K` | Hover docs |
| Tmux | `Ctrl+s c` | Tạo window mới |
| Tmux | `Ctrl+s "` | Split ngang |
| Tmux | `Ctrl+s %` | Split dọc |
| Tmux | `Ctrl+s d` | Detach |
| Tmux | `Ctrl+s [` | Scroll mode |

### 8.3 Troubleshooting

**Nvim plugins không cài:**
```vim
:PackerSync
```

**Tmux plugins không cài:**
```
Ctrl+s I
```

**LSP không hoạt động:**
```vim
:LspRestart    " Restart LSP
:LspInfo      " Xem LSP status
```

**Mất syntax highlighting:**
```vim
:TSUpdate     " Update treesitter parsers
```

**Kitty không mở:**
```bash
# Kiểm tra kitty có trong PATH
which kitty

# Hoặc mở từ Spotlight
```

---

## Tổng kết

Workflow cơ bản:

1. **Mở Kitty** → `Ctrl+Shift+Enter`
2. **Khởi tmux** → `tmux` (hoặc `tmux attach`)
3. **Tạo workspace** → `Ctrl+s c` (new window)
4. **Mở nvim** → `nvim`
5. **Di chuyển** → `Ctrl+h/j/k/l` (giữa nvim splits và tmux panes)
6. **Tìm file** → `Ctrl+p`
7. **Tìm code** → `Ctrl+g`
8. **Code** → `gd` (definition), `K` (hover), `gq` (format)

---

*Được tạo từ cấu hình dotfiles: ~/dotfiles*
*Cập nhật: 2026-05-05*