
"   _  ___   _ ____      _    _   _    _    ____   ___  
"  | |/ / | | |  _ \    / \  | \ | |  / \  |  _ \ / _ \ 
"  | ' /| | | | |_) |  / _ \ |  \| | / _ \ | | | | | | |
"  | . \| |_| |  _ <  / ___ \| |\  |/ ___ \| |_| | |_| |
"  |_|\_\\___/|_| \_\/_/   \_\_| \_/_/   \_\____/ \___/ 

" ==================== Auto load for first time uses ====================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    " Please ensure the vim-plug directory is 'autoload/plug.vim', otherwise vim-plug will won't work. 
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " Auto exec PlugInstall command when enter vim
	" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let g:nvim_plugins_installation_completed=1
" if empty(glob('~/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
" 	let g:nvim_plugins_installation_completed=0
"     " Auto exec PlugInstall command when enter vim
" 	" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" Use space as leader(default is '\')
let mapleader=" "
" Resolve color problem
let &t_ut=''
" Change cursor shape in different modes, neovim dosen't need this. See: https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" Show current mode, file name, file status, ruler, etc.
set laststatus=2

" Basic Settings
" No need compatible with vi(Most of plugins will need this)
set nocompatible
" Most of plugins will dependency this
set termguicolors
" Know file type
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" Encoding
set encoding=utf-8
" Indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Enable system clipboard(You must ensure :echo has('clipboard') return 1 not 0)
set clipboard=unnamed
" Format
set indentexpr=
" Let backspace can delete chars
set backspace=indent,eol,start
" Default one line chars length greater than 78, vim will auto create new line, set tw=0 will close this function
set tw=0
" Code collapse
" Collapse by indent
set foldmethod=indent
" Collapse level
set foldlevel=99
" Show space mark(This config will cause vim become slow down, please enable it only in nvim)
set list
" Use '▫' presents space, use '▸' presents TAB
set listchars=tab:▸\ ,trail:▫
" See :h timeout
set notimeout
set ttimeoutlen=0
" Keep the number of rows(such as tt tb H M)
set scrolloff=5
" Highlight
syntax on
" Show line number
set number
" Enable relative number
set relativenumber
" Disable relative number
"set norelativenumber
" Highlight current line
set cursorline
" Highlight current column
" set cursorcolumn
" Auto wrap line(default value)
" set wrap
" Disable auto wrap
set nowrap
" Show command
set showcmd
" Auto complete command with TAB
set wildmenu
" Highlight search result
set hlsearch
" Cancel highlight search result when enter vim
exec "nohlsearch"
" Highlight search result during the search
set incsearch
" Ignore case when search
set ignorecase
" Enable smart case when search
set smartcase
" Enable mouse
set mouse=a
" Automatically change the current directory See: https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
set autochdir
" Hide last line mode tips if in Insert, Replace or Visual mode, we can use such airline to replace it.
set noshowmode
" Use visual bell replace sources bell
set visualbell
" The screen will not be redraw while excuting macros, registers and other commands that have not been typed.
set lazyredraw
" Show a verticle line on the 120th chars
set colorcolumn=120
" Enable hidden, See also: https://github.com/romgrk/barbar.nvim/issues/153 https://neovim.io/doc/user/options.html#'hidden'
set hidden

" Save cursor location when next enter vim
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Backup and undo
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
" silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

" Command keymap
" Set s no any action
map s <nop>
" Save
map S :w<CR>
" Quit
map Q :q<CR>
" Reload ~/.vimrc file
map <LEADER>rs :source $MYVIMRC<CR>
" Open .vimrc file in anywhere
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" Cancel highlight
map <LEADER><CR> :nohlsearch<CR>
" Split
" To left
map sh :set nosplitright<CR>:vsplit<CR>
" To down
map sj :set splitbelow<CR>:split<CR>
" To up
map sk :set nosplitbelow<CR>:split<CR>
" To right
map sl :set splitright<CR>:vsplit<CR>
" Jump between splits
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
" Loot with splits
map <LEADER>w <C-w>w
" Resize split width or height with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" Change split layout
" Place the two splits side by side
map sf <C-w>t<C-w>H
" Place the two splits up and down
map sd <C-w>t<C-w>K
" New tab
map tn :tabe<CR>
" Next left tab
map E :-tabnext<CR>
" Next right tab
map R :+tabnext<CR>
" First tab
map W :tabfirst<CR>
" Last tab
map T :tablast<CR>
" Move current tab to the left
map tmh :-tabmove<CR>
" Move current tab to the right
map tml :+tabmove<CR>
" Enable or disable spell check
map <LEADER>sc :set spell!<CR>
" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" Generate ascii art by figlet, you can install figlet by exec 'npm install -g figlet-cli' under command line. See: https://github.com/patorjk/figlet-cli
map tx :r !figlet
" Toggle case
map ` ~
" Move quickly
noremap J 5j
noremap K 5k
" noremap E 5e
" noremap B 5b
noremap n nzz
noremap N Nzz
" Map ; to : to quick input comamnd
" noremap ; :
noremap * *zz
noremap # #zz
" Copy selection area to system clipboard
vnoremap Y "+y
" Folding
noremap <LEADER>o za
" Selete to the line end
noremap vL v$h
" Go to start of the line
noremap H ^
" Go to end of the line
noremap L $
" Move up/down the view port without mving the cursor
noremap <C-j> 5<C-e>
noremap <C-k> 5<C-y>
" Move left/right the view port without mving the cursor
noremap <C-h> 20zh
noremap <C-l> 20zl
noremap U <C-r>
noremap o o<Esc>
noremap O O<Esc>

" Insert mode cursor movement
" Spell tips(Only effect under INSERT mode)
" noremap <C-x> ea<C-x>s
" inoremap <C-x> <Esc>ea<C-x>s

" Command mode cursor movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" Open the terminal windows(Use i enter Insert mode so input command, press <C-d> twice to exit terminal)
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
" Find and replace
noremap \s :%s///g<left><left><left>

" Plugin
" Use vim-plug manage plugins
call plug#begin('~/.config/nvim/plugged')

" Tabline
Plug 'romgrk/barbar.nvim'
" Status bar
Plug 'windwp/windline.nvim'
" Theme
Plug 'connorholyday/vim-snazzy'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Icon support
Plug 'kyazdani42/nvim-web-devicons'
" File explorer
Plug 'kyazdani42/nvim-tree.lua'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'
" Display the colour of text
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Search
Plug 'nvim-lua/plenary.nvim'
" if you need telescope live grep function then you need install burntsushi/ripgrep, you can install it by 'brew install ripgrep'
Plug 'nvim-telescope/telescope.nvim'
" Git
" Use sign column to indicate added, modified and removed lines in a file that is managed by a version control system(vcs)
Plug 'lewis6991/gitsigns.nvim'
" Scroll
Plug 'petertriho/nvim-scrollbar'
" Search num tips
Plug 'kevinhwang91/nvim-hlslens'
" " Jump to any positions in the visible window area
" Plug 'ggandor/lightspeed.nvim'
" " Replace . command
" Plug 'tpope/vim-repeat'
" Auto generate pairs that mathced.
Plug 'windwp/nvim-autopairs'
" Multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Comment
Plug 'numToStr/Comment.nvim'
" Easily change, delete, and add surrounding in pairs.
Plug 'tpope/vim-surround'
" Expand slect text
Plug 'gcmt/wildfire.vim'
" Zen mode
Plug 'folke/zen-mode.nvim'
" Bookmark
Plug 'MattesGroeger/vim-bookmarks'
" Lazygit. Please install lazygit first
Plug 'kdheepak/lazygit.nvim'
" Lsp
Plug 'neovim/nvim-lspconfig'
" Completion
" Autocompletion plugin
Plug 'hrsh7th/nvim-cmp'
" LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippets source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip'
" Snippets plugin
Plug 'L3MON4D3/LuaSnip'
" Shade the inactive windows
" Plug 'sunjon/shade.nvim'
" Clipboard manager
Plug 'AckslD/nvim-neoclip.lua'
" Sqlite database for clipboard
Plug 'tami5/sqlite.lua'
" Markdown preview plugin.(Please install pandoc and live-server first)
Plug 'davidgranstrom/nvim-markdown-preview'
" Input method switch
" When press Esc key will auto switch to default input method(Please execute 'brew tap daipeihust/tap && brew install im-select' under command line to install im-select first)
Plug 'ybian/smartim'
" Hightlight yank
Plug 'machakann/vim-highlightedyank'
" Json format
Plug 'axiaoxin/vim-json-line-format'
" Start dashboard
Plug 'glepnir/dashboard-nvim'
" Outline
Plug 'stevearc/aerial.nvim'
call plug#end()

" plugs config
if g:nvim_plugins_installation_completed == 1
" Theme
" Color snazzy
color tokyonight

" ==================== nvim-tree ====================
" Please add lua require'nvim-tree'.setup {}, See also https://github.com/kyazdani42/nvim-tree.lua/issues/767
lua require'nvim-tree'.setup {}
nnoremap tt :NvimTreeToggle<CR>
nnoremap tr :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" ==================== barbar ====================
" Move to previous/next
nnoremap <silent>    E <Cmd>BufferPrevious<CR>
nnoremap <silent>    R <Cmd>BufferNext<CR>
" nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
" nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" ==================== windline ====================
lua <<eof
require('wlsample.airline')
-- the animated alternative. you can toggle animation by press `<leader>u9`
-- require('wlsample.airline_anim')
eof

" ==================== nvim-treesitter ====================
lua <<eof
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "java", "python"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
eof

" ==================== hexokinase ====================
" Color display position
let g:hexokinase_highlighters = [ 'virtual' ]

" ==================== telescope ====================
" Find files using telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" Find chars using telescope command-line sugar.
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Find buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Find tags
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ==================== gitsigns ====================
lua <<eof
require('gitsigns').setup()
require("scrollbar.handlers.search").setup()
eof

" ==================== scrollbar ====================
lua <<eof
require("scrollbar").setup()
eof

" ==================== autopairs ====================
lua << EOF
require("nvim-autopairs").setup {}
EOF

" ==================== comment ====================
lua require('Comment').setup()

" ==================== wildfire ====================
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }

" ==================== zen mode ====================
lua << EOF
require("zen-mode").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
  window = {
    width = .5 -- width will be 50% of the editor width
  }
}
EOF

" ==================== bookmark ====================
" nmap <Leader><Leader> <Plug>BookmarkToggle
nmap mm <Plug>BookmarkToggle
nmap mi <Plug>BookmarkAnnotate
nmap ma <Plug>BookmarkShowAll
nmap mn <Plug>BookmarkNext
nmap mN <Plug>BookmarkPrev
nmap mc <Plug>BookmarkClear
nmap mx <Plug>BookmarkClearAll
nmap mkk <Plug>BookmarkMoveUp
nmap mjj <Plug>BookmarkMoveDown
nmap mg <Plug>BookmarkMoveToLine

" ==================== lazygit ====================
nnoremap <silent> <leader>gg :LazyGit<CR>

" ==================== lsp and cmp ====================
lua << EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    'clangd', 
    -- Install rust_analyzer with command 'brew install rust-analyzer'
    'rust_analyzer',
    -- Install pyright with command 'npm i -g pyright'
    'pyright',
    'tsserver',
    -- To install sumneko_lua you can see here 'https://github.com/sumneko/lua-language-server/wiki/Build-and-Run'
    'sumneko_lua'
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF

" " ==================== shade ====================
" lua << EOF
" require'shade'.setup({
"   overlay_opacity = 90,
"   opacity_step = 1,
"   -- keys = {
"   --   brightness_up    = '<C-Up>',
"   --   brightness_down  = '<C-Down>',
"   --   toggle           = '<Leader>s',
"   -- }
" })
" EOF

" ==================== nvim-neoclip ====================
lua << EOF
-- This line is required if you use vim-plug manage plugins
require('telescope').load_extension('neoclip')
requires = {
  {'tami5/sqlite.lua', module = 'sqlite'},
  -- you'll need at least one of these
  {'nvim-telescope/telescope.nvim'},
  -- {'ibhagwan/fzf-lua'},
}
require('neoclip').setup()
EOF
nnoremap <leader>fv <cmd>Telescope neoclip<cr>

" ==================== nvim-markdown-preivew ====================
" Only effect when edit .md files
map sr :MarkdownPreview<CR>

" ==================== smarttim ====================
" set the default input method will to swithc when press Esc key, you can find current input method id by execute 'im-select' under command line
let g:smartim_default = 'com.apple.keylayout.ABC'

" ==================== vim-highlightedyank ====================
let g:highlightedyank_highlight_duration = 200

" ==================== dashboard ====================
lua << EOF
local db = require('dashboard')
db.custom_center = {
    {icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'},
    {icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f g'},
  }
EOF

" ==================== aerial outline ====================
nnoremap <LEADER>o :AerialToggle<CR>
lua << EOF
-- Call the setup function to change the default behavior
require("aerial").setup({
  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  backends = { "treesitter", "lsp", "markdown" },

  -- Enum: persist, close, auto, global
  --   persist - aerial window will stay open until closed
  --   close   - aerial window will close when original file is no longer visible
  --   auto    - aerial window will stay open as long as there is a visible
  --             buffer to attach to
  --   global  - same as 'persist', and will always show symbols for the current buffer
  close_behavior = "auto",

  -- Set to false to remove the default keybindings for the aerial buffer
  default_bindings = true,

  -- Enum: prefer_right, prefer_left, right, left, float
  -- Determines the default direction to open the aerial window. The 'prefer'
  -- options will open the window in the other direction *if* there is a
  -- different buffer in the way of the preferred direction
  default_direction = "prefer_right",

  -- Disable aerial on files with this many lines
  disable_max_lines = 10000,

  -- Disable aerial on files this size or larger (in bytes)
  disable_max_size = 2000000, -- Default 2MB

  -- A list of all symbols to display. Set to false to display all symbols.
  -- This can be a filetype map (see :help aerial-filetype-map)
  -- To see all available values, see :help SymbolKind
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },

  -- Enum: split_width, full_width, last, none
  -- Determines line highlighting mode when multiple splits are visible.
  -- split_width   Each open window will have its cursor location marked in the
  --               aerial buffer. Each line will only be partially highlighted
  --               to indicate which window is at that location.
  -- full_width    Each open window will have its cursor location marked as a
  --               full-width highlight in the aerial buffer.
  -- last          Only the most-recently focused window will have its location
  --               marked in the aerial buffer.
  -- none          Do not show the cursor locations in the aerial window.
  highlight_mode = "split_width",

  -- Highlight the closest symbol if the cursor is not exactly on one.
  highlight_closest = true,

  -- Highlight the symbol in the source buffer when cursor is in the aerial win
  highlight_on_hover = false,

  -- When jumping to a symbol, highlight the line for this many ms.
  -- Set to false to disable
  highlight_on_jump = 300,

  -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
  -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
  -- default collapsed icon. The default icon set is determined by the
  -- "nerd_font" option below.
  -- If you have lspkind-nvim installed, it will be the default icon set.
  -- This can be a filetype map (see :help aerial-filetype-map)
  icons = {},

  -- Control which windows and buffers aerial should ignore.
  -- If close_behavior is "global", focusing an ignored window/buffer will
  -- not cause the aerial window to update.
  -- If open_automatic is true, focusing an ignored window/buffer will not
  -- cause an aerial window to open.
  -- If open_automatic is a function, ignore rules have no effect on aerial
  -- window opening behavior; it's entirely handled by the open_automatic
  -- function.
  ignore = {
    -- Ignore unlisted buffers. See :help buflisted
    unlisted_buffers = true,

    -- List of filetypes to ignore.
    filetypes = {},

    -- Ignored buftypes.
    -- Can be one of the following:
    -- false or nil - No buftypes are ignored.
    -- "special"    - All buffers other than normal buffers are ignored.
    -- table        - A list of buftypes to ignore. See :help buftype for the
    --                possible values.
    -- function     - A function that returns true if the buffer should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `bufnr` and `buftype`.
    buftypes = "special",

    -- Ignored wintypes.
    -- Can be one of the following:
    -- false or nil - No wintypes are ignored.
    -- "special"    - All windows other than normal windows are ignored.
    -- table        - A list of wintypes to ignore. See :help win_gettype() for the
    --                possible values.
    -- function     - A function that returns true if the window should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `winid` and `wintype`.
    wintypes = "special",
  },

  -- When you fold code with za, zo, or zc, update the aerial tree as well.
  -- Only works when manage_folds = true
  link_folds_to_tree = false,

  -- Fold code when you open/collapse symbols in the tree.
  -- Only works when manage_folds = true
  link_tree_to_folds = true,

  -- Use symbol tree for folding. Set to true or false to enable/disable
  -- 'auto' will manage folds if your previous foldmethod was 'manual'
  manage_folds = false,

  -- These control the width of the aerial window.
  -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  -- min_width and max_width can be a list of mixed types.
  -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
  max_width = { 40, 0.2 },
  width = nil,
  min_width = 10,

  -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
  -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
  nerd_font = "auto",

  -- Call this function when aerial attaches to a buffer.
  -- Useful for setting keymaps. Takes a single `bufnr` argument.
  on_attach = nil,

  -- Call this function when aerial first sets symbols on a buffer.
  -- Takes a single `bufnr` argument.
  on_first_symbols = nil,

  -- Automatically open aerial when entering supported buffers.
  -- This can be a function (see :help aerial-open-automatic)
  open_automatic = false,

  -- Set to true to only open aerial at the far right/left of the editor
  -- Default behavior opens aerial relative to current window
  placement_editor_edge = false,

  -- Run this command after jumping to a symbol (false will disable)
  post_jump_cmd = "normal! zz",

  -- When true, aerial will automatically close after jumping to a symbol
  close_on_select = false,

  -- Show box drawing characters for the tree hierarchy
  show_guides = false,

  -- The autocmds that trigger symbols update (not used for LSP backend)
  update_events = "TextChanged,InsertLeave",

  -- Customize the characters used when show_guides = true
  guides = {
    -- When the child item has a sibling below it
    mid_item = "├─",
    -- When the child item is the last in the list
    last_item = "└─",
    -- When there are nested child guides to the right
    nested_top = "│ ",
    -- Raw indentation
    whitespace = "  ",
  },

  -- Options for opening aerial in a floating win
  float = {
    -- Controls border appearance. Passed to nvim_open_win
    border = "rounded",

    -- Enum: cursor, editor, win
    --   cursor - Opens float on top of the cursor
    --   editor - Opens float centered in the editor
    --   win    - Opens float centered in the window
    relative = "cursor",

    -- These control the height of the floating window.
    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a list of mixed types.
    -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
    max_height = 0.9,
    height = nil,
    min_height = { 8, 0.1 },

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,
  },

  lsp = {
    -- Fetch document symbols when LSP diagnostics update.
    -- If false, will update on buffer changes.
    diagnostics_trigger_update = true,

    -- Set to false to not update the symbols when there are LSP errors
    update_when_errors = true,

    -- How long to wait (in ms) after a buffer change before updating
    -- Only used when diagnostics_trigger_update = false
    update_delay = 300,
  },

  treesitter = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },

  markdown = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },
})
EOF

endif

