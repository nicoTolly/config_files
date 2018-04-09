if &compatible
	set nocompatible
endif
set runtimepath+=~/.local/dein/repos/github.com/Shougo/dein.vim/

if dein#load_state(expand('~/.local/dein/'))
	call dein#begin(expand('~/.local/dein/'))

	call dein#add('Shougo/dein.vim')
	"call dein#add('Shougo/deoplete.nvim')
	"if !has('nvim')
	"	call dein#add('roxma/nvim-yarp')
	"	call dein#add('roxma/vim-hug-neovim-rpc')
	"endif

	call dein#add('rust-lang/rust.vim')
	call dein#add('cespare/vim-toml')
	call dein#add('easymotion/vim-easymotion')
	call dein#add('arnar/vim-matchopen')
	call dein#add('tpope/vim-fugitive')
	"call dein#add('vim-syntastic/syntastic')
  if has('nvim')
    call dein#add('neomake/neomake')
    call dein#add('racer-rust/vim-racer')
  endif
	call dein#add('scrooloose/nerdtree')
	call dein#add('vim-airline/vim-airline')
	call dein#end()
	call dein#save_state()
endif
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Easymotion mappings
map <C-a> <Plug>(easymotion-prefix)
" Change highlight color so it does not conflict with neomake
hi EasyMotionTarget ctermbg=none ctermfg=blue


filetype plugin indent on
syntax enable
set nu
set bg=dark
set incsearch
set tabstop=2 shiftwidth=2 expandtab
set tw=80
"autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'


if has('nvim')
  " When writing a buffer.
  call neomake#configure#automake('w')
  " When writing a buffer, and on normal mode changes (after 750ms).
  call neomake#configure#automake('nw', 750)
  " When reading a buffer (after 1s), and when writing.
  call neomake#configure#automake('rw', 1000)
  set hidden
  let g:racer_cmd = "/home/nico/.cargo/bin/racer"
  let g:racer_experimental_completer = 1
  au FileType rust nmap gd <Plug>(rust-def)
  au FileType rust nmap gs <Plug>(rust-def-split)
  au FileType rust nmap gx <Plug>(rust-def-vertical) 
endif
