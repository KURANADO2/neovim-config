
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
noremap \v v$h
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

endif

