" Gavin GVIM VIMRC
"
" Date: 2012-4-3
" Version: 0.1
" Disclaimer: credit to https://github.com/spf13/spf13-vim



"--------------------------------------------------
" 		Start Setup
"--------------------------------------------------
" Environment {
		" Basics {
			set nocompatible        "must be first line
			filetype off			"turn on after setup
		" }

		" Windows Compatible {
			" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
			" across (heterogeneous) systems easier.
			if has('win32') || has('win64')
			  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
			endif
		" }
		"
		" Setup Bundle Support {
		" The next two lines ensure that the ~/.vim/bundle/ system works
			set rtp+=~/.vim/bundle/vundle
			call vundle#rc()
		" }
" }

"--------------------------------------------------
" 		Bundle List
"--------------------------------------------------
" Bundles {
		"vim settings
		"vundle plugin manager
		Bundle 'gmarik/vundle'
		"addon manager, snip-mate needs it
        Bundle 'MarcWeber/vim-addon-mw-utils'
		"also snip-mate needs it
        Bundle 'tomtom/tlib_vim'
		"ack-grep needed
		Bundle 'mileszs/ack.vim'
		"file explorer manager
		Bundle 'scrooloose/nerdtree'
		"single pane for all tabs
		"Bundle 'jistr/vim-nerdtree-tabs'
		"session manager
		Bundle 'vim-scripts/sessionman.vim'
		"replacement of command-T
		Bundle 'kien/ctrlp.vim'
		"format statusline
		Bundle 'Lokaltog/vim-powerline'
		"easy jumping \w
		Bundle 'Lokaltog/vim-easymotion'

		"auto pair (){}[]''
		Bundle 'AutoClose'
		"allow gvim colorscheme for terminal
		Bundle 'godlygeek/csapprox'
		"colorscheme collections
		"Bundle 'flazz/vim-colorschemes'
		"Gavin color selection and ScrollColor plugin
		Bundle 'gbuntu127/gcolor'

		"programming helpers
		"edit selected region only
		Bundle 'chrisbra/NrrwRgn'
		"syntax checking plugin
		Bundle 'scrooloose/syntastic'
		"snippets support
		Bundle 'garbas/vim-snipmate'
		"collection of snippets
		Bundle 'spf13/snipmate-snippets'
		"indent indicator
		Bundle 'nathanaelkane/vim-indent-guides'
		"git wrapper
		"Bundle 'tpope/vim-fugitive'
		"easy comment
		Bundle 'scrooloose/nerdcommenter'
		"easy format text
		Bundle 'godlygeek/tabular'
		"replacement of taglist, need ctags
		Bundle 'majutsushi/tagbar'
		"ultimate auto-complete
		Bundle 'Shougo/neocomplcache'
		"empty scratch 
		Bundle 'duff/vim-scratch'
		"easy maintain of ctags, requires Exuberant Ctags
		Bundle 'xolox/vim-easytags'
"}


"--------------------------------------------------
" 		Vim Configurations
"--------------------------------------------------
" Vim configuration{

	" General {
			filetype plugin indent on				"automatically detect file types.
			syntax on								"syntax highlighting
			set mouse=a								"automatically enable mouse usage
			set winaltkeys=no						"disable alt of menu mnemonics
			set guicursor+=a:blinkon0				"disable all blinking:
			set nobackup							"no backup
			set noswapfile							"no swapfile
			set autoread							"auto load when changed from outside

			set virtualedit=onemore					"allow for cursor beyond last character
			set history=100							"store a ton of history (default is 20)
			set nospell								"spell checking off
			set hidden								"allow buffer switching without saving
			set autowrite							"automatically write a file when leaving a modified buffer
			set title								"set terminal title to filename

			"set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
			"au BufWinLeave *.* silent! mkview		"make vim save view (state) (folds, cursor, etc)
			"au BufWinEnter *.* silent! loadview		"make vim load view (state) (folds, cursor, etc)
	" }

	" Vim UI {
			set tabpagemax=15						"only show 15 tabs
			set splitbelow							"split windows below current window
			set showmode							"display the current mode
			set cursorline							"highlight current line
			set backspace=indent,eol,start			"backspace for dummies
			set number								"line numbers on
			set showmatch							"show matching brackets/parenthesis
			set incsearch							"find as you type search
			set hlsearch							"highlight search terms
			set ignorecase							"case insensitive search
			set smartcase							"case sensitive when uc present
			set wildmenu							"show list instead of just completing
			set wildmode=list:longest,full			"command <Tab> completion, list matches, then longest common part, then all.
			set whichwrap=b,s,h,l,<,>,[,]			"backspace and cursor keys wrap to
			set scrolljump=5						"lines to scroll when cursor leaves screen
			set foldenable							"auto fold code
			set foldlevel=100						"disable fold when file is opened
			set foldmethod=syntax					"set foldmethod
			set cmdheight=2							"the commandbar height
			set t_Co=256							"enable terminal color
			set cpoptions+=$						"put a $ at word end when using change word
			"set list
			"set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

			if has('cmdline_info')
				set ruler							"show the ruler
				set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) "a ruler on steroids
				set showcmd							"show partial commands in status line and
			endif

			if has('statusline')
				set laststatus=2					"always show status line

				""" Broken down into easily includeable segments
				"set statusline=%<%F\				"filename
				"set statusline+=%w%h%m%r			"options
				""set statusline+=%{fugitive#statusline()} "git hotness
				"set statusline+=\ [%{&ff}/%y]            "filetype
				"set statusline+=\ [%{CurDir()}]          "current dir
				"set statusline+=\ [%{tagbar#currenttag('[Tag:%s]','Tag:N/A')}]		"current tag
				"set statusline+=%=%-14.(%l,%c%v)\ %p%%  "right aligned file nav info

				"" Broken down into easily includeable segments
				"set statusline=%<%f\				"filename
				"set statusline+=%w%h%m%r			"options
				""set statusline+=%{fugitive#statusline()} "Git Hotness
				"set statusline+=\ [%{&ff}/%Y]            "filetype
				"set statusline+=\ [%{getcwd()}]          "current dir
				"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  "Right aligned file nav info
			endif

			" format the statusline
			"set statusline=%<\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ [%{tagbar#currenttag('[%s] ', '')}]\ \ \ Line:\ %l/%L:[%p%%]\ \ \ Col:%c\ \ \ Buf:#%n
			"function! CurDir()
				"let curdir = substitute(getcwd(), '/home/gavin/', "~/", "g")
				"return curdir
			"endfunction
			"function! HasPaste()
				"if &paste
					"return 'PASTE MODE  '
				"else
					"return ''
				"endif
			"endfunction

			autocmd VimEnter * call Maximize_Window()
			function! Maximize_Window()
			  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
			endfunction
	" }

	" Formatting {
			set nowrap								"wrap long lines
			set autoindent							"indent at the same level of the previous line
			set shiftwidth=4						"use indents of 4 spaces
			set noexpandtab							"tabs are not spaces but tabs
			set tabstop=4							"an indentation every four columns
			set softtabstop=4						"let backspace delete indent
			set smarttab							"smart tab insert/delete

			"remove trailing whitespaces and ^M chars
			"autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml
			"autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
	" }

	" Session {
			fu! SaveSess()
				if bufnr('$') >= 8
					execute 'mksession! ' . getcwd() . '/.session.vim'
				endif
			endfunction

			fu! RestoreSess()
			if filereadable(getcwd() . '/.session.vim')
				execute 'so ' . getcwd() . '/.session.vim'
				if bufexists(1)
					for l in range(1, bufnr('$'))
						if bufwinnr(l) == -1
							exec 'sbuffer ' . l
						endif
					endfor
				endif
			endif
			endfunction

			"autocmd VimLeave * call SaveSess()
			"autocmd VimEnter * call RestoreSess()
	" }
" }




"--------------------------------------------------
" 		Key Mappings
"--------------------------------------------------
" Key (re)Mappings {

		"change from default \ to ,
		let mapleader = ','
		let g:mapleader = ','

		"easier return to cmd mode
		imap jj <esc>

	"Movement Mapping {

		"easier moving in tabs and windows
		map <C-J> <C-W>j<C-W>_
		map <C-K> <C-W>k<C-W>_
		map <C-L> <C-W>l<C-W>_
		map <C-H> <C-W>h<C-W>_

		"wrapped lines goes down/up to next row, rather than next line in file.
		nnoremap j gj
		nnoremap k gk

		"easy half screen move
		noremap <A-j> <C-d>
		noremap <A-k> <C-u>

		" goto buffer and tabs
		map <A-right> <ESC>:bn<CR>
		map <A-left> <ESC>:bp<CR>
		map <C-right> <ESC>gt<CR>
		map <C-left> <ESC>gT<CR>
	"}

	"Windows Mapping {

		"show quickfix win
		map <F3> :Ctoggle<CR>
		function! s:qf_toggle()
			for i in range(1, winnr('$'))
				let bnum = winbufnr(i)
				if getbufvar(bnum, '&buftype') == 'quickfix'
					cclose
					return
				endif
			endfor

			copen
		endfunction
		command! Ctoggle call s:qf_toggle()
	"}

	"Tab Mapping {
		nmap <leader>_ :Scratch<CR>			"create a scratch buffer
		nmap <leader>= :tabnew<CR>			"create an empty tab
		nnoremap <leader>gt :tabclose<CR>	"close a tab
	"}

	"Editing Mapping {

		nnoremap Y y$						"Yank till line end

		vnoremap < <gv						"visual shifting left (does not exit Visual mode)
		vnoremap > >gv 						"visual shifting right (does not exit Visual mode)

		"easy to edit of files under current file path
		cnoremap %% <C-R>=expand('%:h').'/'<cr>
		"easy to edit of files under current file path
		cnoremap %% <C-R>=expand('%:h').'/'<cr>
		"edit file in current window
		nmap <leader>ew :e %%<CR>
		"edit file in vertically split window
		nmap <leader>es :vsp %%<CR>
		"edit file in new tab
		nmap <leader>et :tabe %%<CR>

		"switch two lines
		nmap <leader>gj mz:m+<cr>`z
		nmap <leader>gk mz:m-2<cr>`z
		vmap <leader>gj :m'>+<cr>`<my`>mzgv`yo`z
		vmap <leader>gk :m'<-2<cr>`>my`<mzgv`yo`z

		"<leader>l/L deletes blank line below/above, and <leader>o/O inserts.
		nnoremap <silent><leader>gl m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
		nnoremap <silent><leader>gL m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
		nnoremap <silent><leader>go :set paste<CR>m`o<Esc>``:set nopaste<CR>
		nnoremap <silent><leader>gO :set paste<CR>m`O<Esc>``:set nopaste<CR>

		"CTRL+S: save, note need to add "stty -ixon" to .bashrc for terminal vim
		noremap <C-S>		:update<CR>
		vnoremap <C-S>		<C-C>:update<CR>
		inoremap <C-S>		<C-O>:update<CR>

		"copy cut paste, traditional support
		vnoremap <C-C>	"+y
		"map <C-S-P>		"+gP
		noremap <C-P>		"+gP
		vnoremap <C-X>	"+x

		"CTRL-A is Select all
		noremap <C-A> gggH<C-O>G
		inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
		cnoremap <C-A> <C-C>gggH<C-O>G
		onoremap <C-A> <C-C>gggH<C-O>G
		snoremap <C-A> <C-C>gggH<C-O>G
		xnoremap <C-A> <C-C>ggVG

		"CTRL-Tab is Next tab
		noremap <C-Tab> gt
		inoremap <C-Tab> <C-O>gt
		cnoremap <C-Tab> <C-C>gt
		onoremap <C-Tab> <C-C>gt

		"CTRL-SHIFT-Tab is Previous tab
		noremap <C-S-Tab> gT
		inoremap <C-S-Tab> <C-O>gT
		cnoremap <C-S-Tab> <C-C>gT
		onoremap <C-S-Tab> <C-C>gT

		"CTRL-Z is Undo; not in cmdline though, this hide gvim suspend command
		noremap <C-Z> u
		inoremap <C-Z> <C-O>u

		"use space to open fold
		nnoremap <silent> <Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>
		vnoremap <Space> zf
		
		"remove trailing of some c files
		nnoremap <leader>rt :%s///g<CR>

		"when you forget to sudo.
		cmap w!! w !sudo tee % >/dev/null
	"}

	"Function Mapping {

		set pastetoggle=<F12><CR>				"paste mode toggle

		noremap <leader>gp :set paste! paste?<CR>	"toggle paste mode
		noremap <leader>gh :nohlsearch<CR>			"clearing highlighted search
		noremap <leader>gn :set number! number?<CR>	"line number
		noremap <leader>gw :set wrap! wrap?<CR>		"warp line
		noremap <leader>gs :set spell!<CR>			"enable spell checking

		noremap <Leader>q :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
		noremap <Leader>qv :vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
		noremap <Leader>qt :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
	"}

	"Command Mapping {

		"change to current file dir
		cnoremap cwd lcd %:p:h<CR>				"change to current file dir
		cnoremap cd. lcd %:p:h<CR>				"change to current file dir

		"easier cmd history
		cnoremap <C-P> <Up>						"previous command in command history
		cnoremap <C-N> <Down>					"next command in command history

		"easier paste, this disabled literal insertion
		"cmap <C-V>		<C-R>+					"support ctrl-v paste in command mode
		cmap <C-P>		<C-R>+					"support ctrl-v paste in command mode

		"help on current word in new tab
		cnoreabbrev h tab h
		nmap <leader><F1> :h <C-R>=expand("<cword>")<CR><CR>
		nmap <leader><leader><F1> :helpgrep <C-R>=expand("<cword>")<CR><CR>
		au! FileType help map <buffer> <F1> :q<CR>
	"}

	"VIMRC Mapping {

		nmap <leader>ev :tabe $MYVIMRC<CR>	" edit the vimrc file
		nmap <leader>sv :so $MYVIMRC<CR>	" reload the vimrc file
	"}
" }

"--------------------------------------------------
" 		Plugin Settings
"--------------------------------------------------
" Plugins {

    " Misc {
        "let g:NERDShutUp=0
        "let b:match_ignorecase = 1
    " }

    " Ctrlp{
		let g:ctrlp_map = '<leader>b'
		"matching on top
		let g:ctrlp_match_window_bottom = 1
		"most recent used"
		nnoremap <leader>bf :CtrlPMRU<CR>
		"buffer list"
		nnoremap <leader>bb :CtrlPBuffer<CR>
		"max windows height"
		let g:ctrlp_max_height = 50
    " }

    " NarrowRegion{
		"default to vertical region
		let g:nrrw_rgn_vert = 1
		"extract narrow window
		xmap <leader>nr <Plug>NrrwrgnDo<C-W>=
    " }

    " Powerline{
		if has('gui_running')
			let g:Powerline_symbols = 'unicode'
			"insert curdir befere file name
			call Pl#Theme#InsertSegment('pwd', 'before', 'fileinfo')
			""insert tag after fileinfo [todo]
			"let g:current_tag_name = "%{tagbar#currenttag('[%s] ', '')}"
			"call Pl#Segment#Create('tagname','g:current_tag_name')
			"call Pl#Theme#InsertSegment('tagname', 'after', 'fileinfo')
		endif 
	" }

    " ScrollColors{
		nnoremap <silent><F8> :NEXTCOLOR<CR>
		nnoremap <silent><F7> :PREVCOLOR<CR>
	" }

    " Ack-grep {
		" set ack-grep as search engine, define searching type
		let g:ackprg="ack-grep -H --nocolor --nogroup --column"
		set grepprg=ack-grep\ --cpp\ --cc\ --perl\ --python\ --make

		" use ack-grep to search
		nmap <leader><leader>sw :Ack <C-R>=expand("<cword>")<CR><CR>
		nmap <leader><leader>ss :Ack
    " }

    " OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        "hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        "hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        "hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
    " }

    " EasyTag {
        set tags=./.tags;,~/.vimtags			"tag storage places, local folder first, otherwise to global one
		let g:easytags_cmd = 'ctags'			"ctag program location, eqv. to /usr/local/bin/ctags
		let g:easytags_dynamic_files = 2		"=0 means global first, =1 means local first, =2 means local only

		let g:easytags_include_members = 1		"ctags by default does not generate tags for class and structs
		highlight link cMember Special			"adapt colorscheme to highlight class/struct tags
		"highlight cMember gui=italic			"can aslo define it by yourself
		"let g:easytags_resolve_links = 1		"if you use symbolic link a lot
		nnoremap <C-F11> :UpdateTags -R ./<CR>  "update tags of all files under current directory
		" }

    " AutoCloseTag {
        "" Make it so AutoCloseTag works for xml and xhtml files as well
        "au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        "nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " NerdTree {
		noremap <silent> <F2> :NERDTreeToggle<CR>
        "map <leader>e :NERDTreeFind<CR>
        "nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        "let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=1
    " }

    " Tabularize {
        if exists(":Tabularize")
          nmap <Leader>f= :Tabularize /=<CR>
          vmap <Leader>f= :Tabularize /=<CR>
          nmap <Leader>f: :Tabularize /:<CR>
          vmap <Leader>f: :Tabularize /:<CR>
          nmap <Leader>f:: :Tabularize /:\zs<CR>
          vmap <Leader>f:: :Tabularize /:\zs<CR>
          nmap <Leader>f, :Tabularize /,<CR>
          vmap <Leader>f, :Tabularize /,<CR>
          nmap <Leader>f<Bar> :Tabularize /<Bar><CR>
          vmap <Leader>f<Bar> :Tabularize /<Bar><CR>

          " The following function automatically aligns when typing a supported character
          inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
          function! s:align()
              let p = '^\s*|\s.*\s|\s*$'
              if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
                  let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                  let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                  Tabularize/|/l1
                  normal! 0
                  call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
              endif
          endfunction

        endif
     " }

     " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :args *.cpp *.h<CR>
     " }

     " Buffer explorer {
        "nmap <leader>b :BufExplorer<CR>
     " }

     " ctrlp {
        let g:ctrlp_working_path_mode = 2
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
     "}

     " TagBar {
        nnoremap <silent><F4> :TagbarToggle<CR>
        let g:tagbar_left = 1
     "}

     "" Fugitive {
        "nnoremap <silent> <leader>gs :Gstatus<CR>
        "nnoremap <silent> <leader>gd :Gdiff<CR>
        "nnoremap <silent> <leader>gc :Gcommit<CR>
        "nnoremap <silent> <leader>gb :Gblame<CR>
        "nnoremap <silent> <leader>gl :Glog<CR>
        "nnoremap <silent> <leader>gp :Git push<CR>
     ""}

     " neocomplcache {
        let g:neocomplcache_enable_at_startup = 1				"disable AutoComplPop.
        let g:neocomplcache_enable_camel_case_completion = 1	"use neocomplcache.
        let g:neocomplcache_enable_smart_case = 1				"use smartcase.
        let g:neocomplcache_enable_underbar_completion = 1		"use underbar completion.
		let g:neocomplcache_enable_camel_case_completion = 1	"use camel case completion.
        let g:neocomplcache_min_syntax_length = 3				"set minimum syntax keyword length.
        let g:neocomplcache_enable_auto_delimiter = 1

        "autoComplPop like behavior.
        let g:neocomplcache_enable_auto_select = 0

        "superTab like snippets behavior.
        imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        "plugin key-mappings.
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand)
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()


        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
     " }
" }



"--------------------------------------------------
" 		General Aabbreviations
"--------------------------------------------------
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab becuase   because
iab Becuase   Because
iab seperate  separate
iab Seperate  Separate
iab texr      \textcolor{red}{
