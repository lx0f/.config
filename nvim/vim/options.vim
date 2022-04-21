" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8 
scriptencoding utf-8

" Enable filetype plugins
filetype plugin on
filetype indent on

" The best colorscheme ever
colorscheme gruvbox 

" Sets 500 lines of history for Vim to remember
set history=500 

" Sets relative numberline and shows current line number
set relativenumber number 

" Enables mouse to interact with Vim
set mouse=a 

" A guide to help make code more readable
set colorcolumn=80 

" Allows Vim to copy to system clipboard
set clipboard=unnamedplus 

" Permanently expands column so it doesn't jiggle the screen
set signcolumn=yes:1 

" Set to auto read when a file is changed from the outside
set autoread 
au FocusGained,BufEnter * checktime

" Set 8 lines to the cursor when moving vertically
set so=8 

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the wild menu
set wildmenu 

" Ignore compiled files
set wildignore=*.o,*~,*.pyc 
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler 

" Height of the command bar
set cmdheight=1 

" A buffer becomes hidden when it is abandoned
set hid 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent 
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase 

" When searching try to be smart about cases
set smartcase 

" Highlight search results
set hlsearch 

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic 

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2 

" No annoying sound on errors
set noerrorbells 
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim") 
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1 

" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal' 
    set t_Co=256
endif
set background=dark

" Set extra options when running in GUI mode
if has("gui_running") 
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac 

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup 
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab 

" Be smart when using tabs ;)
set smarttab 

" 1 tab == 4 spaces
set shiftwidth=4 
set tabstop=4

" Linebreak on 500 characters
set lbr 
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Emmet vim key binding
let g:user_emmet_leader_key='<leader>'
