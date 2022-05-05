call plug#begin('~/.config/nvim/plugged')
"debugger
Plug 'puremourning/vimspector'
" Lsp and completion sutff
Plug 'neovim/nvim-lspconfig'
Plug 'kosayoda/nvim-lightbulb'
Plug 'ErichDonGubler/lsp_lines.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'weilbith/nvim-code-action-menu'
Plug 'onsails/diaglist.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-lua/completion-nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'vlime/vlime', {'rtp': 'vim/'}
" Dressing
Plug 'stevearc/dressing.nvim'
" Litee
Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/litee-calltree.nvim'
Plug 'ldelossa/litee-symboltree.nvim'
Plug 'ldelossa/litee-bookmarks.nvim'
"virtualenv
Plug 'PieterjanMontens/vim-pipenv'
Plug 'plytophogy/vim-virtualenv'
" Scrollbar
Plug 'dstein64/nvim-scrollview'
" Completion framework
Plug 'hrsh7th/nvim-cmp'
" surround
Plug 'tpope/vim-surround'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" colorizer
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rust-lang/rust.vim'
" Parentheses
Plug 'cohama/lexima.vim'
" wildmenu
function! UpdateRemotePlugins(...)
  " Needed to refresh runtime files
  let &rtp=&rtp
  UpdateRemotePlugins
endfunction

Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'David-Kunz/treesitter-unit'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
" status bar
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Snippet completion source for nvim-cmp
Plug 'ray-x/cmp-treesitter'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wookayin/fzf-ripgrep.vim'
" Misc
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'tpope/vim-fugitive'
Plug 'simrat39/symbols-outline.nvim'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'luukvbaal/nnn.nvim'
Plug 'chentau/marks.nvim'
Plug 'tpope/vim-repeat'
Plug 'DaeZak/crafttweaker-vim-highlighting'
" Writer mode
Plug 'folke/zen-mode.nvim'
Plug 'junegunn/limelight.vim'
Plug 'rhysd/vim-grammarous'
" orgmode
Plug 'nvim-neorg/neorg'
" code runner
Plug 'is0n/jaq-nvim'

call plug#end()
" Set completeopt to have a better completion experience
set termguicolors
" orgmode
lua << EOF
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}
EOF
lua << EOF
require'zen-mode'.setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = true }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = true,
      font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}
EOF
lua << EOF
require('neorg').setup{
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
          }},
    ["core.keybinds"] = {
    config = {
        default_keybinds = true,
        }},
    ["core.norg.manoeuvre"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.norg.qol.toc"] = {},
}
      }
EOF
nnoremap <leader>toc :Neorg toc split<CR>

set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20
command -nargs=+ LspHover lua vim.lsp.buf.hover()
let &t_ut=''
set keywordprg=:LspHover
lua << EOF
require("notify").setup({
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Function called when a window is closed
  on_close = nil,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- Default timeout for notifications
  timeout = 5000,

  -- Max number of columns for messages
  max_width = nil,
  -- Max number of lines for a message
  max_height = nil,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
  background_colour = "Normal",

  -- Minimum width for notification windows
  minimum_width = 50,

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
vim.notify = require("notify")
EOF
lua require'bufferline'.setup{}
lua << EOF
    require("lsp_lines").register_lsp_virtual_lines()
    vim.diagnostic.config({
  virtual_text = false,
})
vim.diagnostic.config({ virtual_lines = true })
EOF
lua << EOF
require'nvim-lightbulb'.setup {
    -- LSP client names to ignore
    -- Example: {"sumneko_lua", "null-ls"}
    ignore = {},
    sign = {
        enabled = true,
        -- Priority of the gutter sign
        priority = 10,
    },
    float = {
        enabled = false,
        -- Text to show in the popup float
        text = "💡",
        -- Available keys for window options:
        -- - height     of floating window
        -- - width      of floating window
        -- - wrap_at    character to wrap at for computing height
        -- - max_width  maximal width of floating window
        -- - max_height maximal height of floating window
        -- - pad_left   number of columns to pad contents at left
        -- - pad_right  number of columns to pad contents at right
        -- - pad_top    number of lines to pad contents at top
        -- - pad_bottom number of lines to pad contents at bottom
        -- - offset_x   x-axis offset of the floating window
        -- - offset_y   y-axis offset of the floating window
        -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
        -- - winblend   transparency of the window (0-100)
        win_opts = {},
    },
    virtual_text = {
        enabled = false,
        -- Text to show at virtual text
        text = "💡",
        -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
        hl_mode = "replace",
    },
    status_text = {
        enabled = false,
        -- Text to provide when code actions are available
        text = "💡",
        -- Text to provide when no actions are available
        text_unavailable = ""
    }
}
EOF
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
lua << EOF
    require("diaglist").init({
        -- optional settings
        -- below are defaults
        debug = false,
    
        -- increase for noisy servers
        debounce_ms = 150,
    })
EOF
nmap <space>da <cmd>lua require('diaglist').open_all_diagnostics()<cr>
nmap <space>db <cmd>lua require('diaglist').open_buffer_diagnostics()<cr>
set nu
function Pip_init() 
if filereadable("Pipfile")
Pipenv
endif
endfunction
au VimEnter * if exists('Pipenv') | :call Pip_init()
nnoremap <F8> :SymbolsOutline<CR>
lua << EOF
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = {},
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = true,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 150,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  mappings = {}
}
EOF
let g:rainbow_active = 1
lua << EOF
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "<C>k",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}
EOF
syntax enable
set smartindent
set modifiable
set nowrap
set noswapfile
set nobackup
set clipboard=unnamedplus
set shell=zsh
call wilder#setup({'modes': [':', '/', '?']})
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
" treesitter setup
lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<C-*>",
        goto_previous_usage = "<C-#>",
      },
    },
  },
}
EOF
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"norg", "norg_meta", "norg_table"},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
EOF

" To enable more of the features of rust-analyzer, such as inlay hints and
" more!
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
lua << EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
lua << EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = false
  }
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = { enable = true },
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
nnoremap <leader>s :TSPlaygroundToggle<CR>
cnoreabbrev term tabnew +term
au BufRead,BufNewFile *.g4 setfiletype antlr4
au BufRead,BufNewFile *.lisp setfiletype lisp
nohl
set mouse=niv
set nocompatible
nmap <leader>l :Jaq<CR>
" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
let g:code_runner_save_before_execute = 1
cnoreabbrev refresh so ~/.config/nvim/init.vim
colorscheme gruvbox
" vimspector
au BufRead,BufNewFile *.py cnoreabbrev debugger_init !cp ./Templates/vimspector-python.json .vimspector.json
au BufRead,BufNewFile *.rs cnoreabbrev debugger_init !cp ./Templates/vimspector-rust.json .vimspector.json
au BufRead,BufNewFile *.sh cnoreabbrev debugger_init !cp ./Templates/vimspector-bash.json .vimspector.json
cnoreabbrev debug_end call vimspector#Reset()
cnoreabbrev watch VimspectorWatch
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>dat :call vimspector#ToggleAdvancedBreakpoint()<CR>

nmap <Leader>du <Plug>VimspectorStepOut
nmap <Leader>di <Plug>VimspectorStepInto
nmap <Leader>do <Plug>VimspectorStepOver
" Set the basic sizes
let g:vimspector_sidebar_width = 25
let g:vimspector_code_minwidth = 75
function! s:CustomiseUI()
  " Customise the basic UI...

  " Close the output window
  call win_gotoid( g:vimspector_session_windows.output )
  q
  call win_gotoid( g:vimspector_session_windows.stack_trace )
  q
endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseUI()
augroup END

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
cnoreabbrev debug_end call vimspector#Reset()
xmap <Leader>di <Plug>VimspectorBalloonEval
cnoreabbrev debug_map h vimspector-visual-studio-vscode
" emmet
au FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
" searcher
lua << EOF
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nmap <silent> <Leader>t :sil! Telescope<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --hidden
nnoremap <silent> <Leader>f :RgFzf<CR>
nnoremap <silent> <Leader>r :Rg<Cr>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" status bar 
lua << EOF
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}
local function getWords()
  return tostring(vim.fn.wordcount().words)
end
local config = {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
    },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
        
      },
    lualine_c = {},
    lualine_x = {{ "diagnostics", sources = { "nvim_lsp" }}, 
      "filename",
      { getWords }, "location"},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = {'branch'},
    },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
require('lualine').setup(config)
EOF
" misc
lua require 'colorizer'.setup()
let g:loaded_python_provider = 0
let g:python3_host_prog  = '/usr/bin/python3'
set background=dark " use dark mode
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
" file tree
lua require'nnn'.setup()
nmap <F2> :NnnPicker<CR>
nmap <F3> :NnnExplorer<CR>
" Tabs 
let mapleader = "\\" 
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :sil! bd!<CR>
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>c :CodeActionMenu<CR>
" LSP
lua << EOF
	local lsp_installer = require("nvim-lsp-installer")

	lsp_installer.on_server_ready(function(server)

	local opts = {}

	if server.name == "rust_analyzer" then
			require("rust-tools").setup({
	    tools = { -- rust-tools options
	        -- Automatically set inlay hints (type hints)
	        autoSetHints = true,
	
	        -- Whether to show hover actions inside the hover window
	        -- This overrides the default hover handler 
	        hover_with_actions = true,
	
			-- how to execute terminal commands
			-- options right now: termopen / quickfix
			executor = require("rust-tools/executors").termopen,
	
	        runnables = {
	            -- whether to use telescope for selection menu or not
	            use_telescope = true
	
	            -- rest of the opts are forwarded to telescope
	        },
	
	        debuggables = {
	            -- whether to use telescope for selection menu or not
	            use_telescope = true
	
	            -- rest of the opts are forwarded to telescope
	        },
	
	        -- These apply to the default RustSetInlayHints command
	        inlay_hints = {
	
	            -- Only show inlay hints for the current line
	            only_current_line = false,
	
	            -- Event which triggers a refersh of the inlay hints.
	            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
	            -- not that this may cause  higher CPU usage.
	            -- This option is only respected when only_current_line and
	            -- autoSetHints both are true.
	            only_current_line_autocmd = "CursorHold",
	
	            -- wheter to show parameter hints with the inlay hints or not
	            show_parameter_hints = true,
	
	            -- prefix for parameter hints
	            parameter_hints_prefix = "<- ",
	
	            -- prefix for all the other hints (type, chaining)
	            other_hints_prefix = "=> ",
	
	            -- whether to align to the length of the longest line in the file
	            max_len_align = false,
	
	            -- padding from the left if max_len_align is true
	            max_len_align_padding = 1,
	
	            -- whether to align to the extreme right or not
	            right_align = false,
	
	            -- padding from the right if right_align is true
	            right_align_padding = 7,
	
	            -- The color of the hints
	            highlight = "Comment",
	        },
	
	        hover_actions = {
	            -- the border that is used for the hover window
	            -- see vim.api.nvim_open_win()
	            border = {
	                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
	                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
	                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
	                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
	            },
	
	            -- whether the hover action window gets automatically focused
	            auto_focus = false
	        },
	
	        -- settings for showing the crate graph based on graphviz and the dot
	        -- command
	        crate_graph = {
	            -- Backend used for displaying the graph
	            -- see: https://graphviz.org/docs/outputs/
	            -- default: x11
	            backend = "x11",
	            -- where to store the output, nil for no output stored (relative
	            -- path from pwd)
	            -- default: nil
	            output = nil,
	            -- true for all crates.io and external crates, false only the local
	            -- crates
	            -- default: true
	            full = true,
	        }
	    },
	
	    -- all the opts to send to nvim-lspconfig
	    -- these override the defaults set by rust-tools.nvim
	    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
		server = {
			-- standalone file support
			-- setting it to false may improve startup time
			standalone = true,
			cmd = { vim.env.HOME .. '/.local/share/nvim/lsp_servers/rust/rust-analyzer' },
		}, -- rust-analyer options
    on_attach = on_attach
	})
	return
	elseif server.name == "html" then
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		opts = {capabilities=capabilities,on_attach = on_attach, cmd={ vim.env.HOME .. "/.local/share/nvim/lsp_servers/html/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server", "--stdio"}}
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    end
	 cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = false, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
  floating_window_off_y = 1, -- adjust float windows y position.


  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = 2, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., 
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

-- recommended:
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
server:setup(opts)
end)
EOF
nmap <silent> <C-_> gcc
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua << EOF
local cmp = require'cmp'
local luasnip = require 'luasnip'
require("luasnip.loaders.from_snipmate").load({ paths = { "~/.config/nvim/snippets" } })
require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/plugged/friendly-snippets" } })
local lspkind = require('lspkind').init({
    mode = 'symbol_text',
    symbol_map = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = 'ﰠ  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}
})
cmp.setup({
  -- Enable LSP snippets
  formatting = {
	  format = require'lspkind'.cmp_format({
        mode = 'symbol_text',
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	     menu = ({
	     buffer = "[Buffer]",
	     nvim_lsp = "[LSP]",
	     cmp_tabinine = "[TabNine]",
         path = "[Path]",
         treesitter = "[TreeSitter]",
         luasnip = "[LuaSnip]"
	   })
	  }),
	},
  snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<Up>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<Down>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    -- { name = 'cmp_tabnine'  },
    { name = 'treesitter' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'neorg' }
  },
})
--   tabnine = require('cmp_tabnine.config')
--   tabnine:setup({
--   max_lines = 1000;
--   max_num_results = 20;
--   sort = true;
--   run_on_every_keystroke = true;
--   snippet_placeholder = '..';
-- })
EOF
" au BufRead,BufNew *.lisp lua require'cmp'.setup({enabled=false})
" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          
    return "\<tab>"
  endif
  return "\<C-X>\<C-O>"                         " plugin matching
endfunction
au BufRead,BufNewFile *.lisp inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=100
" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>
lua << EOF
-- configure the litee.nvim library 
require('litee.lib').setup({
    tree = {
        icon_set = "codicons"
    },
    panel = {
        orientation = "right",
        panel_size  = 30
    },
    term = {
        position = "bottom",
        term_size = 15,
    }
})
require('litee.bookmarks').setup({})
require('litee.symboltree').setup({
    icon_set = "codicons",
    hide_cursor = false,
})
require('litee.calltree').setup({
    icon_set = "codicons",
    hide_cursor = false,
})

local opts = { silent = true }
-- litee.lib mappings
vim.api.nvim_set_keymap("n", "<C-t>",   ":LTPanel<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-t>t",  ":LTPanel<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>tm", ":LTTerm<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-t>h",  ":LTClearJumpHL<cr>", opts)

-- calltree specific commands
vim.api.nvim_set_keymap("n", "<C-h>o",     ":LTOpenToCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>oo",    ":LTPopOutCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>n",     ":LTNextCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>p",     ":LTPrevCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>e",     ":LTExpandCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>c",     ":LTCollapseCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>C",     ":LTCollapseAllCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>f",     ":LTFocusCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>S",     ":LTSwitchCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>j",     ":LTJumpCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>s",     ":LTJumpCalltreeSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>v",     ":LTJumpCalltreeVSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>t",     ":LTJumpCalltreeTab<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>h",     ":LTHoverCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>d",     ":LTDetailsCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>e",     ":LTCloseCalltree<cr>", opts)

-- symboltree specific commands
vim.api.nvim_set_keymap("n", "<C-s>o", ":LTOpenToSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>oo", ":LTPopOutSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>n", ":LTNextSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>p", ":LTPrevSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>e", ":LTExpandSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>c", ":LTCollapseSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>C", ":LTCollapseAllSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>j", ":LTJumpSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>s", ":LTJumpSymboltreeSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>v", ":LTJumpSymboltreeVSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>t", ":LTJumpSymboltreeTab<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>h", ":LTHoverSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>d", ":LTDetailsSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>x", ":LTCloseSymboltree<cr>", opts)

-- bookmarks specific commands
vim.api.nvim_set_keymap("n", "<C-b>n", ":LTOpenNotebook<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>o", ":LTOpenToNotebook<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>oo", ":LTPopOutNotebook<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>l", ":LTListNotebooks<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>c", ":LTCreateBookmark<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>e", ":LTCloseNotebook<cr>", opts)

vim.api.nvim_set_keymap("n", "<C-l>o", "<cmd>lua require('litee.lib.lsp.wrappers').buf_outgoing_calls()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-l>i", "<cmd>lua require('litee.lib.lsp.wrappers').buf_incoming_calls()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-l>s", "<cmd>lua require('litee.lib.lsp.wrappers').buf_document_symbol()<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-l>o", "<cmd>lua require('litee.lib.lsp.wrappers').buf_outgoing_calls()<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-l>i", "<cmd>lua require('litee.lib.lsp.wrappers').buf_incoming_calls()<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-l>s", "<cmd>lua require('litee.lib.lsp.wrappers').buf_document_symbol()<CR>", opts)

-- configure litee-calltree.nvim
require('litee.calltree').setup({})
-- configure litee-symboltree.nvim
require('litee.symboltree').setup({})
EOF
lua << EOF
local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end
local luasnip = prequire('luasnip')
local cmp = prequire("cmp")
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end
_G.tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    end
    return ""
end

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
EOF
lua << EOF
vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local lvl = ({
    'ERROR',
    'WARN',
    'INFO',
    'DEBUG',
  })[result.type]
  notify({ result.message }, lvl, {
    title = 'LSP | ' .. client.name,
    timeout = 10000,
    keep = function()
      return lvl == 'ERROR' or lvl == 'WARN'
    end,
  })
end
local client_notifs = {}

local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
  local notif_data = client_notifs[client_id][token]

  if notif_data and notif_data.spinner then
    local new_spinner = (notif_data.spinner + 1) % #spinner_frames

    local new_notif = vim.notify(nil, nil, {
      hidden = true,
      icon = spinner_frames[new_spinner],
      replace = notif_data.notification,
    })

    client_notifs[client_id][token] = {
      notification = new_notif,
      spinner = new_spinner,
    }

    vim.defer_fn(function()
      update_spinner(client_id, token)
    end, 100)
  end
end

local function format_title(title, client)
  return client.name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
  return (percentage and percentage .. "%\t" or "") .. (message or "")
end

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
  local client_id = ctx.client_id

  local val = result.value

  if not val.kind then
    return
  end
  if not client_notifs[client_id] then
    client_notifs[client_id] = {}
  end

  local notif_data = client_notifs[client_id][result.token]

  if val.kind == "begin" then
    local message = format_message(val.message, val.percentage)

    local notification = vim.notify(message, "info", {
      title = format_title(val.title, vim.lsp.get_client_by_id(client_id)),
      icon = spinner_frames[1],
      timeout = false,
      hidden = false,
    })

    client_notifs[client_id][result.token] = {
      notification = notification,
      spinner = 1,
    }

    update_spinner(client_id, result.token)
  elseif val.kind == "report" and notif_data then
    local new_notif = vim.notify(format_message(val.message, val.percentage), "info", {
      replace = notif_data.notification,
      hidden = false,
    })

    client_notifs[client_id][result.token] = {
      notification = new_notif,
      spinner = notif_data.spinner,
    }
  elseif val.kind == "end" and notif_data then
    local new_notif =
      vim.notify(val.message and format_message(val.message) or "Complete", "info", {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000,
      })

    client_notifs[client_id][result.token] = {
      notification = new_notif,
    }
  end
end
EOF
" dressing
lua << EOF
require('dressing').setup({
  input = {
    -- Set to false to disable the vim.ui.input implementation
    enabled = true,

    -- Default prompt string
    default_prompt = "➤ ",

    -- Can be 'left', 'right', or 'center'
    prompt_align = "left",

    -- When true, <Esc> will close the modal
    insert_only = true,

    -- These are passed to nvim_open_win
    anchor = "SW",
    border = "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "cursor",

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    -- Window transparency (0-100)
    winblend = 10,
    -- Change default highlight groups (see :help winhl)
    winhighlight = "",

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,

    -- see :help dressing_get_config
    get_config = nil,
  },
  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,

    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

    -- Options for telescope selector
    -- These are passed into the telescope picker directly. Can be used like:
    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = {},

    -- Options for fzf selector
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },

    -- Options for fzf_lua selector
    fzf_lua = {
      winopts = {
        width = 0.5,
        height = 0.4,
      },
    },

    -- Options for nui Menu
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      max_width = 80,
      max_height = 40,
    },

    -- Options for built-in selector
    builtin = {
      -- These are passed to nvim_open_win
      anchor = "NW",
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",

      -- Window transparency (0-100)
      winblend = 10,
      -- Change default highlight groups (see :help winhl)
      winhighlight = "",

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },

      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
    },

    -- Used to override format_item. See :help dressing-format
    format_item_override = {},

    -- see :help dressing_get_config
    get_config = nil,
  },
})
EOF
" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
lua << EOF
require('jaq-nvim').setup{
    -- Commands used with 'Jaq'
    cmds = {
        -- Default UI used (see `Usage` for options)
        default = "float",

        -- Uses external commands such as 'g++' and 'cargo'
        external = {
            markdown = "glow %",
            python = "python3 %",
            rust = "cargo run",
        },

        -- Uses internal commands such as 'source' and 'luafile'
        internal = {
            lua = "luafile %",
            vim = "source %"
        }
    },

    -- UI settings
    ui = {
        -- Start in insert mode
        startinsert = false,

        -- Switch back to current file
        -- after using Jaq
        wincmd      = false,

        -- Floating Window / FTerm settings
        float = {
            -- Floating window border (see ':h nvim_open_win')
            border    = "none",

            -- Num from `0 - 1` for measurements
            height    = 0.8,
            width     = 0.8,
            x         = 0.5,
            y         = 0.5,

            -- Highlight group for floating window/border (see ':h winhl')
            border_hl = "FloatBorder",
            float_hl  = "Normal",

            -- Floating Window Transparency (see ':h winblend')
            blend     = 0
        },

        terminal = {
            -- Position of terminal
            position = "bot",

            -- Open the terminal without line numbers
            line_no = false,

            -- Size of terminal
            size     = 10
        },

        toggleterm = {
            -- Position of terminal, one of "vertical" | "horizontal" | "window" | "float"
            position = "horizontal",

            -- Size of terminal
            size     = 10
        },

        quickfix = {
            -- Position of quickfix window
            position = "bot",

            -- Size of quickfix window
            size     = 10
        }
    }
}
EOF
function Write()
    Limelight!! 0.5
    ZenMode
endfunction
cnoreabbrev cg GrammarousCheck
cnoreabbrev Write call Write()
nnoremap <leader>z :ZenMode<CR>
