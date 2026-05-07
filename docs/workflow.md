## Developer Workflow Guide

Tài liệu này bám theo cấu hình thật trong repo hiện tại, không theo cấu hình cũ.
Mục tiêu là dùng `kitty` + `tmux` + `nvim` như một workflow terminal-first ổn định trên macOS.

## 1. Khởi động nhanh

1. Mở `kitty`.
2. Vào project.
3. Chạy `tmux new -As dev` để mở hoặc attach session `dev`.
4. Trong tmux:
   - `Ctrl+a |` để chia dọc
   - `Ctrl+a -` để chia ngang
   - pane trái mở `nvim`
   - pane phải trên chạy agent/AI
   - pane phải dưới chạy test/lệnh build

Lần đầu sau khi cài:

```bash
nvim
:Lazy sync
```

Trong tmux, cài TPM plugin bằng:

```text
Ctrl+a I
```

## 2. Kitty

Các phím đang có trong `kitty.conf`:

| Tác vụ | Phím |
|---|---|
| Tab mới | `Ctrl+Shift+t` |
| Đóng tab | `Ctrl+Shift+w` |
| Tab trước | `Ctrl+Shift+Up` |
| Tab sau | `Ctrl+Shift+Down` |
| Window/pane mới trong kitty | `Ctrl+Shift+Enter` |
| Window trước | `Ctrl+Shift+[` |
| Window sau | `Ctrl+Shift+]` |
| Copy | `Ctrl+Shift+c` |
| Paste | `Ctrl+Shift+v` |
| Tăng cỡ chữ | `Ctrl+=` |
| Giảm cỡ chữ | `Ctrl+-` |
| Reset cỡ chữ | `Ctrl+0` |
| Reload config | `Ctrl+Shift+F5` |

Ghi chú:

- `macos_option_as_alt left` đã bật. `Option` bên trái sẽ hoạt động như `Alt`, nên các key như `Alt+j` và `Alt+k` trong Neovim dùng được.
- `shell_integration enabled` và `term xterm-kitty` đã bật để terminal reporting và keyboard protocol ổn định hơn.

## 3. Tmux

Prefix là `Ctrl+a`.

### 3.1 Session

| Tác vụ | Lệnh / phím |
|---|---|
| Tạo session mới | `tmux new -s work` |
| Attach session gần nhất | `tmux a` |
| Attach session theo tên | `tmux a -t work` |
| Danh sách session | `tmux ls` |
| Detach | `Ctrl+a d` |
| Đổi tên session | `Ctrl+a $` |

### 3.2 Window và pane

| Tác vụ | Phím |
|---|---|
| Window mới | `Ctrl+a c` |
| Split dọc | `Ctrl+a |` |
| Split ngang | `Ctrl+a -` |
| Split nhanh sang phải | `Ctrl+a l` |
| Đóng pane | `Ctrl+a x` |
| Đổi pane theo hướng | `Ctrl+a h/j/k` hoặc `Ctrl+a Right` |
| Resize pane | `Ctrl+a H/J/K/L` |
| Pane trước đó | `Ctrl+\` |
| Zoom pane | `Ctrl+a z` |
| Đóng window | `Ctrl+a q` |
| Window trước | `Ctrl+a ,` |
| Window sau | `Ctrl+a .` |
| Reload tmux config | `Ctrl+a r` |

### 3.3 Di chuyển pane

`Ctrl+h`, `Ctrl+j`, `Ctrl+k`, `Ctrl+l` luôn di chuyển giữa các tmux pane.

Nếu đang ở trong Neovim và muốn đi giữa split của Neovim, dùng:

- `Ctrl+a h/j/k`
- `Ctrl+a Right`

`Ctrl+a l` luôn tạo split mới sang phải rồi chuyển focus sang pane vừa tạo.

### 3.4 Copy mode

| Tác vụ | Phím |
|---|---|
| Vào copy mode | `Ctrl+a [` |
| Di chuyển | `h/j/k/l` hoặc phím mũi tên |
| Bắt đầu chọn | `v` |
| Copy | `y` |
| Paste tmux buffer | `Ctrl+a ]` |
| Thoát | `q` hoặc `Esc` |

`y` trong copy mode đã pipe qua `pbcopy`, nên text được đưa thẳng vào clipboard macOS.

## 4. Neovim

Leader là `Space`.

Khi mở `nvim` không kèm file, bạn sẽ thấy dashboard `Alpha` với các nút tìm file, grep, tạo file mới và mở config.

### 4.1 Quản lý plugin và health check

| Tác vụ | Lệnh |
|---|---|
| Đồng bộ plugin | `:Lazy sync` |
| Mở UI plugin manager | `:Lazy` |
| Kiểm tra tổng quát | `:checkhealth` |
| Kiểm tra LSP | `:LspInfo` |
| Xem hint keymap | `:WhichKey` |

### 4.2 File và tìm kiếm

| Tác vụ | Phím |
|---|---|
| Dashboard mở sẵn | khi `nvim` không có file |
| Tìm file | `<leader>ff` |
| Grep toàn project | `<leader>fg` |
| Danh sách buffer | `<leader>fb` |
| Help tags | `<leader>fh` |
| File gần đây | `<leader>fr` |
| Fzf file search | `<leader>fa` |
| Fzf live grep | `<leader>fz` |
| Toggle file tree | `<space>s` |

### 4.3 Lưu, thoát, điều hướng

| Tác vụ | Phím |
|---|---|
| Lưu file | `<leader>w` |
| Thoát cửa sổ hiện tại | `<leader>q` |
| Thoát toàn bộ | `<leader>Q` |
| Clear search highlight | `<leader>h` |
| Strip trailing spaces | `<leader><space>` |
| Đổi cwd theo file hiện tại | `<leader>cd` |
| Yank toàn buffer | `<leader>y` |
| Thoát terminal mode | `Esc` trong terminal buffer |

### 4.4 Chỉnh sửa nhanh

| Tác vụ | Phím |
|---|---|
| Thoát insert mode nhanh | `jk` hoặc `kj` |
| Move line xuống | `Alt+j` |
| Move line lên | `Alt+k` |
| Move block xuống | `Alt+j` ở visual mode |
| Move block lên | `Alt+k` ở visual mode |
| Comment | `gc` |
| Jump tới 1 ký tự | `f` |
| Jump tới 2 ký tự | `F` |

### 4.5 LSP và diagnostics

| Tác vụ | Phím |
|---|---|
| Go to definition | `gd` |
| Go to declaration | `gD` |
| Go to implementation | `gi` |
| Find references | `gr` |
| Hover | `K` |
| Rename symbol | `<leader>rn` |
| Code action | `<leader>ca` |
| Format buffer | `<leader>f` |
| Diagnostic trước | `[d` |
| Diagnostic sau | `]d` |
| Diagnostic tại dòng | `<leader>e` |
| Danh sách diagnostics | `<leader>xx` |

LSP hiện được auto-enable nếu executable có sẵn cho các server:

- `dartls`
- `lua_ls`
- `bashls`
- `jsonls`
- `yamlls`
- `taplo`
- `marksman`

Muốn biết server nào thực sự attach vào buffer hiện tại thì dùng `:LspInfo`.

### 4.6 Git trong Neovim

| Tác vụ | Phím |
|---|---|
| Git status | `<leader>gs` |
| Add file hiện tại | `<leader>gw` |
| Commit | `<leader>gc` |
| Push | `<leader>gp` |
| Pull | `<leader>gl` |
| Hunk kế | `]c` |
| Hunk trước | `[c` |
| Stage hunk | `ghs` |
| Reset hunk | `ghr` |
| Preview hunk | `ghp` |
| Blame line | `ghb` |

## 5. Workflow đề xuất

### 5.1 Code + agent + test

Pane layout:

1. Pane trái: `nvim`
2. Pane phải trên: Codex / Claude / agent khác
3. Pane phải dưới: `pnpm test`, `flutter test`, `cargo test`, `npm run dev`, v.v.

Di chuyển qua lại bằng `Ctrl+h/j/k/l`.

### 5.2 Tìm file và grep

Trong project lớn:

1. `<leader>ff` để tìm file theo tên.
2. `<leader>fg` để grep toàn project.
3. `<leader>fb` để chuyển buffer đã mở.
4. `<space>s` để giữ cây thư mục luôn bám theo file hiện tại.

### 5.3 Sửa nhanh nhiều dòng

1. Chọn block ở visual mode.
2. `Alt+j` hoặc `Alt+k` để kéo block.
3. `gc` để comment/uncomment.
4. `<leader><space>` để dọn khoảng trắng cuối dòng trước khi commit.

## 6. So với repo `imdanielbui/nvim-config`

Repo tham chiếu kia đầy đủ và rộng hơn nhiều:

- nhiều plugin hơn
- docs cài đặt chi tiết hơn
- bật server theo executable
- có `which-key`, `fzf-lua`, `nvim-ufo`, nhiều health-oriented option

Repo hiện tại cố tình giữ gọn hơn, nhưng đã mang về các phần hữu ích nhất cho terminal workflow:

- auto-enable LSP theo executable
- `which-key` để nhìn leader map nhanh
- grep dùng `rg`
- split behavior và scroll behavior tốt hơn
- fix `cmp` snippet engine
- fix keymap xung đột giữa `telescope` và `fzf-lua`
- fix `tmux` + `kitty` integration

## 7. Troubleshooting

### 7.1 Nvim không thấy plugin mới

Chạy:

```vim
:Lazy sync
```

### 7.2 Alt key không hoạt động trong nvim

Kiểm tra:

- đang dùng `kitty`
- dùng `Option` bên trái trên macOS
- đã reload kitty config bằng `Ctrl+Shift+F5`

### 7.3 Copy từ tmux không ra clipboard macOS

Kiểm tra:

```bash
which pbcopy
tmux show -g set-clipboard
```

Giá trị `set-clipboard` nên là `on`.

### 7.4 LSP không attach

Kiểm tra:

```vim
:LspInfo
:checkhealth vim.lsp
```

Rồi xác nhận executable ngoài shell:

```bash
which dart
which lua-language-server
which bash-language-server
which yaml-language-server
```

## 8. Lệnh kiểm tra nhanh

```bash
nvim --version
tmux -V
kitty --version
```

```vim
:checkhealth
:LspInfo
:Lazy
:WhichKey
```
