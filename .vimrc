set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set termguicolors
set hidden
set showcmd
set showmode
set hlsearch
set showmatch
set autoread
set noshowmode
set ignorecase      " searches are case-insensitive
set smartcase       " ...unless you actually include capital letters in the search string

set scrolloff=3
set cmdheight=2     " enlarge the command area to two lines
set number          " display line numbers
filetype off

set laststatus=2
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive' 	" git plugin, use :Git/:G
Plugin 'justinmk/vim-sneak'	" shortcut for searching for strings
Plugin 'itchyny/lightline.vim'	" lightweight statusline/tabline
Plugin 'airblade/vim-gitgutter'	" show git diffs and details

" Everything related to NERDtree
Plugin 'preservim/nerdtree'			" directory pane
Plugin 'Xuyuanp/nerdtree-git-plugin' 		" show git status for files
Plugin 'ryanoasis/vim-devicons'			" add filetype-specific icons
Plugin 'scrooloose/nerdtree-project-plugin'	" NERDtree persistence

call vundle#end()

filetype plugin indent on

" lightline color settings
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }

let g:seoul256_background = 234
let g:seould256_srgb = 1
colorscheme seoul256
set background=dark

augroup NERD
	au!
	" Start NERDTree and put the cursor back in the other window.
	autocmd VimEnter * NERDTree | wincmd p

	" Exit Vim if NERDTree is the only window left.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | 
		\ quit | endif

	" Open the existing NERDTree on each new tab.
	autocmd BufWinEnter * silent NERDTreeMirror
	autocmd VimEnter * call lightline#update()
augroup END

" Set default width of NERDTree
let NERDTreeWinSize = 50
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'    :'*',
    \ 'Staged'      :'+',
    \ 'Untracked'   :'%',
    \ 'Renamed'     :'➜',
    \ 'Unmerged'    :'=',
    \ 'Deleted'     :'-',
    \ 'Dirty'       :'.',
    \ 'Ignored'     :'!',
    \ 'Clean'       :'✔︎',
    \ 'Unknown'     :'?',
    \ } 
