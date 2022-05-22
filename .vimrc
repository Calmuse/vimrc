"===========================================================================
"***************************************************************************
"*                         Lu Yicheng's VIM script                         *
"*                               Version 2.0                               *
"*                                                                         *
"*                         Last modified : 2020.7.3                        *
"***************************************************************************
"
"---------------------------------------------------------------------------
"    Linux CMD Reference
"---------------------------------------------------------------------------                        
" du -sh                             : show disk usage
" find . -type f -size +500M         : find files larger than 500M
"
" vncserver -geometry 1900x1000      : vncserver remote control
" /sbin/fuser -k .nfs*               : remove vcs nfs... files

"===========================================================================
"                                \u5feb\u6377\u952e\u8bb0\u5f55
" __________________________________________________________________________
" |  #  |      Shortcut      |         Function  Description
" __________________________________________________________________________  
"    1  | F2                 |  \u6253\u5f00/\u5173\u95ednerdtree \uff08win\u7aef\u5e38\u5e38\u8981\u914d\u5408Fn\u952e\u4f7f\u7528\uff09
"    2  | r                  |  refresh nerdtree dir                  
"    3  | \u9009\u4e2d\u51e0\u884c\u6309 =       |  \u9009\u4e2d\u90e8\u5206\u667a\u80fd\u6392\u7248 
"    4  | shift + >\u6216<       |  \u5de6\u53f3\u7f29\u8fdb\uff082\u4e2a\u7a7a\u683c\uff09
"    5  | \il                |  IndentLine 
"    6  | \tb                |  \u81ea\u52a8 testbench.v
"    7  | \ev                |  \u6253\u5f00.vimrc
"    8  | \sv                |  \u7acb\u5373\u751f\u6548.vimrc
"    9  | \rv                |  \u81ea\u52a8\u8fd0\u884ctb\u751f\u6210\u6ce2\u5f62\u5e76\u67e5\u770b
"   10  | \vd                |  run verdi and load .v .fsdb
"   11  | g + t              |  \u5728\u591a\u4e2atab\u4e4b\u95f4\u5207\u6362
"   12  | \vg                |  \u81ea\u52a8\u4f8b\u5316
"   13  | g+d                |  \u9ad8\u4eae\u6240\u6709\u4e0e\u9009\u62e9\u5355\u8bcd\u76f8\u540c\u7684\u5355\u8bcd
"   14  | \dv                |  \u81ea\u52a8 dumpfile codes
"   15  | :noh               |  \u53d6\u6d88\u6240\u6709\u9ad8\u4eae
"   16  | \u9f20\u6807\u53f3\u952e+shift     |  \u9ad8\u4eae\u5f53\u524d\u5355\u8bcd 
"   17  | \dc                |  auto synthesis and view circuit 
"   18  | \sm                |  state machine snap
"   19  | \py                |  run python 
"   20  | ctrl+c,+v,+z,+a    |  windows\u5feb\u6377\u952e,ctrl+v\u73b0\u5728\u662f\u7c98\u8d34,\u539f\u5757\u9009\u53d8\u4e3aCtrl + q
"   21  | Ctrl + w           |  \u6279\u91cf\u6ce8\u91ca// 
" 
"----  function switch ---------------- on(1) | off(0)                                   
let g:auto_run_verilog_sim_enable = 1  "function 6,9,10
let g:code_snippet_enable = 1          "function 14,18   
let g:auto_dc_vision_enable = 1        "function 17
let g:windows_shortkey_enable = 0      "function 20      
let g:block_comment_enable = 1         "function 21

"===========================================================================
"                               VIM reference
"___________________________________________________________________________
"|  #  |      Shortcut      |         Function  Description
"__________________________________________________________________________  
"   1  | vaw / viw          | select whole word 
"   2  | u / ctrl + r       | \u64a4\u9500\uff0c\u53d6\u6d88\u64a4\u9500
"   3  | shift+v / ctrl+v   | line select / block select                 
"   4  | $/A                | to line end (2$:2 lines end) 
"   5  | 0/^                | to line begin
"   6  | d                  | cut
"   7  | ctrl + a           | select num + 1
" --------------------------------------------------------------------------
"  < \u5224\u65ad\u64cd\u4f5c\u7cfb\u7edf\u662f\u5426\u662f Windows \u8fd8\u662f Linux >
" --------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif
" --------------------------------------------------------------------------
"  < \u5224\u65ad\u662f\u7ec8\u7aef\u8fd8\u662f Gvim >
" --------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
  else
    let g:isGUI = 0
endif

" --------------------------------------------------------------------------
"  < Vundle \u63d2\u4ef6\u7ba1\u7406\u5de5\u5177\u914d\u7f6e >
" --------------------------------------------------------------------------
" \u7528\u4e8e\u66f4\u65b9\u4fbf\u7684\u7ba1\u7406vim\u63d2\u4ef6\uff0c\u5177\u4f53\u7528\u6cd5\u53c2\u8003 :h vundle \u5e2e\u52a9
" Vundle\u5de5\u5177\u5b89\u88c5\u65b9\u6cd5\u4e3a\u5728\u7ec8\u7aef\u8f93\u5165\u5982\u4e0b\u547d\u4ee4
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


set nocompatible                                      "\u7981\u7528 Vi \u517c\u5bb9\u6a21\u5f0f
filetype off                                          "\u7981\u7528\u6587\u4ef6\u7c7b\u578b\u4fa6\u6d4b

set rtp+=/home/soc/zhulx19/.vim/bundle/Vundle.vim
"/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/home/soc/luyc18/.vim/after
set rtp-=/usr/share/vim/vimfiles
let vim_bundle_path = '/home/soc/zhulx19/.vim/bundle/'

call vundle#begin(vim_bundle_path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kshenoy/vim-signature'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'tomasr/molokai'
"Plugin 'morhetz/gruvbox'
Plugin 'Yggdroot/indentLine'
"Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache.vim' "auto bu quan
"Plugin 'nathanaelkane/vim-indent-guides'   "\u6dfb\u52a0\u884c\uff0c\u6dfb\u52a0vim-indent-guides\u63d2\u4ef6
""Plugin 'airblade/vim-gitgutter'  "git diff 
call vundle#end()            " required
filetype plugin indent on    " required

" -----------------------------------------------------------------------------
"  < \u7f16\u5199\u6587\u4ef6\u65f6\u7684\u914d\u7f6e >
" -----------------------------------------------------------------------------
colorscheme elflord          " \u7740\u8272\u6a21\u5f0f\uff1a\u9ec4\u8272\u548c\u7c89\u7ea2\u8272\u4e3a\u4e3b
set guifont=courier\ new\ 12    " \u5b57\u4f53 && \u5b57\u53f7
set backspace=2              " \u8bbe\u7f6e\u9000\u683c\u952e\u53ef\u7528
"set autoindent               " \u81ea\u52a8\u5bf9\u9f50
"set ai!                      " \u8bbe\u7f6e\u81ea\u52a8\u7f29\u8fdb
"set smartindent              " \u667a\u80fd\u81ea\u52a8\u7f29\u8fdb
set shiftwidth=2             " \u6362\u884c\u65f6\u884c\u95f4\u4ea4\u9519\u4f7f\u75282\u7a7a\u683c
"set cindent shiftwidth=2     " \u81ea\u52a8\u7f29\u8fdb2\u7a7a\u683c
set nu!                      " \u663e\u793a\u884c\u53f7
"set mouse=a                  " \u542f\u7528\u9f20\u6807
set ruler                    " \u53f3\u4e0b\u89d2\u663e\u793a\u5149\u6807\u4f4d\u7f6e\u7684\u72b6\u6001\u884c
set incsearch                " \u5f00\u542f\u5b9e\u65f6\u641c\u7d22\u529f\u80fd
set hlsearch                 " \u5f00\u542f\u9ad8\u4eae\u663e\u793a\u7ed3\u679c
set nowrapscan               " \u641c\u7d22\u5230\u6587\u4ef6\u4e24\u7aef\u65f6\u4e0d\u91cd\u65b0\u641c\u7d22
set nocompatible             " \u5173\u95ed\u517c\u5bb9\u6a21\u5f0f
"set vb t_vb=                 " \u5173\u95ed\u63d0\u793a\u97f3
set hidden                   " \u5141\u8bb8\u5728\u6709\u672a\u4fdd\u5b58\u7684\u4fee\u6539\u65f6\u5207\u6362\u7f13\u51b2\u533a
"set autochdir                " \u8bbe\u5b9a\u6587\u4ef6\u6d4f\u89c8\u5668\u76ee\u5f55\u4e3a\u5f53\u524d\u76ee\u5f55
set foldmethod=syntax        " \u9009\u62e9\u4ee3\u7801\u6298\u53e0\u7c7b\u578b
set foldlevel=100            " \u7981\u6b62\u81ea\u52a8\u6298\u53e0
set laststatus=2             " \u5f00\u542f\u72b6\u6001\u680f\u4fe1\u606f
set cmdheight=2              " \u547d\u4ee4\u884c\u7684\u9ad8\u5ea6\uff0c\u9ed8\u8ba4\u4e3a1\uff0c\u8fd9\u91cc\u8bbe\u4e3a2
"set showmatch               " \u663e\u793a\u62ec\u53f7\u914d\u5bf9\u60c5\u51b5
"set cursorline              " \u7a81\u51fa\u663e\u793a\u5f53\u524d\u884c
"set nowrap                  " \u8bbe\u7f6e\u4e0d\u81ea\u52a8\u6362\u884c
set writebackup              " \u8bbe\u7f6e\u65e0\u5907\u4efd\u6587\u4ef6
set nobackup
"set list                     " \u663e\u793aTab\u7b26\uff0c\u4f7f\u7528\u4e00\u9ad8\u4eae\u7ad6\u7ebf\u4ee3\u66ff
set listchars=tab:\|\ ,
set tabstop=2                " \u8bbe\u7f6eTab\u952e\u7684\u5bbd\u5ea6        [\u7b49\u540c\u7684\u7a7a\u683c\u4e2a\u6570]
set expandtab                " \u5c06Tab\u81ea\u52a8\u8f6c\u5316\u6210\u7a7a\u683c    [\u9700\u8981\u8f93\u5165\u771f\u6b63\u7684Tab\u952e\u65f6\uff0c\u4f7f\u7528 Ctrl+V + Tab]
syntax enable                " \u6253\u5f00\u8bed\u6cd5\u9ad8\u4eae
"syntax on                    " \u5f00\u542f\u6587\u4ef6\u7c7b\u578b\u4fa6\u6d4b
"filetype indent on           " \u9488\u5bf9\u4e0d\u540c\u7684\u6587\u4ef6\u7c7b\u578b\u91c7\u7528\u4e0d\u540c\u7684\u7f29\u8fdb\u683c\u5f0f
filetype plugin on           " \u9488\u5bf9\u4e0d\u540c\u7684\u6587\u4ef6\u7c7b\u578b\u52a0\u8f7d\u5bf9\u5e94\u7684\u63d2\u4ef6
filetype plugin indent on    " \u542f\u7528\u81ea\u52a8\u8865\u5168

" -----------------------------------------------------------------------------
" NERDTree config
" -----------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary")
" \u5f53vim\u542f\u52a8\u65f6\u81ea\u52a8\u5207\u6362\u5f53\u524d\u76ee\u5f55\u5230vim\u6253\u5f00\u6587\u4ef6\u7684\u76ee\u5f55
autocmd VimEnter * cd %:p:h
autocmd vimenter * NERDTree  "auto open nerdtree

" \u8bbe\u7f6e\u4ee3\u7801\u914d\u8272\u65b9\u6848
if g:isGUI
    colorscheme molokai               "Gvim\u914d\u8272\u65b9\u6848
else
    colorscheme molokai               "\u7ec8\u7aef\u914d\u8272\u65b9\u6848
endif
"colorscheme slate 
" -----------------------------------------------------------------------------
"  < indentLine \u63d2\u4ef6\u914d\u7f6e >
" -----------------------------------------------------------------------------
" \u7528\u4e8e\u663e\u793a\u5bf9\u9f50\u7ebf\uff0c\u4e0e indent_guides \u5728\u663e\u793a\u65b9\u5f0f\u4e0a\u4e0d\u540c\uff0c\u6839\u636e\u81ea\u5df1\u559c\u597d\u9009\u62e9\u4e86
" \u5728\u7ec8\u7aef\u4e0a\u4f1a\u6709\u5c4f\u5e55\u5237\u65b0\u7684\u95ee\u9898\uff0c\u8fd9\u4e2a\u95ee\u9898\u80fd\u89e3\u51b3\u6709\u66f4\u597d\u4e86
" \u5f00\u542f/\u5173\u95ed\u5bf9\u9f50\u7ebf
nmap <leader>il :IndentLinesToggle<CR>
 " \u8bbe\u7f6e\u5bf9\u9f50\u7ebf\u9ed8\u8ba4\u5f001/\u51730\u72b6\u6001
let g:indentLine_enabled = 0
if g:isGUI
    let g:indentLine_char = "\u250a"
    let g:indentLine_first_char = "\u250a"
endif
 
" \u8bbe\u7f6e\u7ec8\u7aef\u5bf9\u9f50\u7ebf\u989c\u8272\uff0c\u5982\u679c\u4e0d\u559c\u6b22\u53ef\u4ee5\u5c06\u5176\u6ce8\u91ca\u6389\u91c7\u7528\u9ed8\u8ba4\u989c\u8272
let g:indentLine_color_term = 239
 
" \u8bbe\u7f6e GUI \u5bf9\u9f50\u7ebf\u989c\u8272\uff0c\u5982\u679c\u4e0d\u559c\u6b22\u53ef\u4ee5\u5c06\u5176\u6ce8\u91ca\u6389\u91c7\u7528\u9ed8\u8ba4\u989c\u8272
let g:indentLine_color_gui = '#666666'
"

" -----------------------------------------------------------------------------
"  < neocomplcache \u63d2\u4ef6\u914d\u7f6e >
" -----------------------------------------------------------------------------
set completeopt-=preview
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1

" -----------------------------------------------------------------------------
" verilog enable floding
" -----------------------------------------------------------------------------
set foldmethod=syntax

"let g:SuperTabDefaultCompletionType = 'context'
"
" -----------------------------------------------------------------------------
" verilog \u81ea\u52a8\u4f8b\u5316
" -----------------------------------------------------------------------------
if(g:islinux == 1)
    so ~/.vim/bundle/vlog_inst_gen.vim 
else
    so $VIM/vimfiles/bundle/vlog_inst_gen.vim 
endif
nnoremap <leader>vg :VlogInstGen<CR>
" -----------------------------------------------------------------------------
" windows shortkeys
" -----------------------------------------------------------------------------

if(g:windows_shortkey_enable == 1)
  if(g:islinux == 1)
      so ~/.vim/bundle/windows_shortkey.vim 
    else
      so $VIM/vimfiles/bundle/windows_shortkey.vim 
  endif
endif
" -----------------------------------------------------------------------------
"  code snippets
" -----------------------------------------------------------------------------

if(g:code_snippet_enable == 1)
  if(g:islinux == 1)
      so ~/.vim/bundle/code_snippet.vim 
    else
      so $VIM/vimfiles/bundle/code_snippet.vim 
  endif
endif
" -----------------------------------------------------------------------------
"  block commont < \u52a0\u5165\u6216\u5220\u9664\u6ce8\u91ca// >
" -----------------------------------------------------------------------------
if(g:block_comment_enable == 1)
  if(g:islinux == 1)
      so ~/.vim/bundle/block_comment.vim 
    else
      so $VIM/vimfiles/bundle/block_comment.vim 
  endif
endif
" -----------------------------------------------------------------------------
"  auto testbench,vcs,verdi scripts
" -----------------------------------------------------------------------------
if(g:auto_run_verilog_sim_enable == 1)
  if(g:islinux == 1)
      so ~/.vim/bundle/auto_run_verilog_sim.vim 
    else
      so $VIM/vimfiles/bundle/auto_run_verilog_sim.vim 
  endif
endif
" -----------------------------------------------------------------------------
"  auto dc vision and simple synthesis
" -----------------------------------------------------------------------------
if(g:auto_dc_vision_enable == 1)
  if(g:islinux == 1)
      so ~/.vim/bundle/auto_dc_vision.vim 
    else
      so $VIM/vimfiles/bundle/auto_dc_vision.vim 
  endif
endif

" -----------------------------------------------------------------------------
" syntastic
" -----------------------------------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"""
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_verilog_checkers = ['vcs']
"nnoremap <leader>cv :SyntasticCheck<CR>

" -----------------------------------------------------------------------------
"\u7f16\u8f91 \u6211\u7684 vimrc \u6587\u4ef6 
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"\u91cd\u8bfb \u6211\u7684 vimrc \u6587\u4ef6 
:nnoremap <leader>sv :source $MYVIMRC<cr>
" -----------------------------------------------------------------------------
let g:neocomplcache_enable_quick_match = 1 

" \u6bcf\u884c\u8d85\u8fc780\u4e2a\u7684\u5b57\u7b26\u7528\u4e0b\u5212\u7ebf\u6807\u793a
au BufRead,BufNewFile *.s,*.c,*.cpp,*.h,*.cl,*.rb,*.sql,*.sh,*.vim,*.js,*.css,*.html 2match Underlined /.\%81v/

" \u8bbe\u7f6e\u7f16\u7801
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

" -----------------------------------------------------------------------------
"  <  \u6279\u91cf\u7f29\u8fdb\u548c\u53d6\u6d88\u7f29\u8fdb\u4ee5\u53ca\u9009\u4e2d\u81ea\u52a8\u7f29\u8fdb >
" -------------------------------------------------------------------
nnoremap = ==
vnoremap = =gv
nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

"-------------------------------------------------------------------
"    run python 
"-------------------------------------------------------------------
:nnoremap <leader>py :call Auto_py()<cr>
function! Auto_py()
   let vname = expand('%')
   execute ":!python ".vname 

endfunction

