{ pkgs }:

{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  extraConfig = ''
    "-------------------------------------------------------------------------------
    " Basic settings (leader, numbers, list...)
    "-------------------------------------------------------------------------------
    syntax on
    filetype plugin on
    filetype plugin indent on
    set nu
    set encoding=utf-8
    set t_Co=256
    let mapleader=","
    set clipboard+=unnamedplus

    set background=dark

    " Highlight nonascii characters
    au BufWinEnter * let w:matchnonascii=matchadd('ErrorMsg', "[\x7f-\xff]", -1)

    " Show hidden characters
    set list
    set listchars=eol:↵,trail:·,tab:>-,nbsp:␣

    " Word with dash belongs together
    set iskeyword+=-

    "-------------------------------------------------------------------------------
    " Most common mappings (file finder, buffers, fulltext...)
    "-------------------------------------------------------------------------------
    map <C-f> :Files<CR>
    map <leader>b :Buffers<CR>
    nnoremap <leader>g :Rg<CR>
    nnoremap <leader>m :Marks<CR>

    "-------------------------------------------------------------------------------
    " Split navigation & settings
    "-------------------------------------------------------------------------------
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    nnoremap <leader>v :vsplit<CR>
    nnoremap <leader>h :split<CR>
    set splitbelow
    set splitright

    "-------------------------------------------------------------------------------
    " Fulltext search using ripgrep
    "-------------------------------------------------------------------------------
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)
  '';
  plugins = [
    {
      plugin = pkgs.vimPlugins.nerdtree;
      config = ''
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
        autocmd VimEnter * wincmd p
        map <C-N> :NERDTreeToggle<CR>
        map <C-E> :NERDTreeFind<CR>
        let NERDTreeQuitOnOpen = 1
        " https://github.com/preservim/nerdtree/issues/1321#issuecomment-1229071986
        let g:NERDTreeMinimalMenu=1
      '';
    }
    {
      plugin = pkgs.vimPlugins.papercolor-theme;
      config = "colorscheme PaperColor";
    }
    pkgs.vimPlugins.editorconfig-vim
    pkgs.vimPlugins.vim-fugitive
    pkgs.vimPlugins.vim-gitgutter
    pkgs.vimPlugins.fzf-vim
    pkgs.vimPlugins.vim-polyglot
    pkgs.vimPlugins.coc-spell-checker
    pkgs.vimPlugins.coc-pyright
    pkgs.vimPlugins.coc-tsserver
    pkgs.vimPlugins.coc-vetur
    pkgs.vimPlugins.coc-clangd
    pkgs.vimPlugins.coc-rust-analyzer
    pkgs.vimPlugins.coc-yaml
    pkgs.vimPlugins.coc-json
    pkgs.vimPlugins.coc-html
    pkgs.vimPlugins.coc-css
    pkgs.vimPlugins.coc-docker
    pkgs.vimPlugins.coc-go
    {
      plugin = pkgs.vimPlugins.coc-nvim;
      config = ''
        " Set python3 interpreter for coc (incl. pynvim pkg)
        " let g:python3_host_prog='~/bin/nvim-python/bin/python3'

        " Use Ctrl + j / Ctrl + k to navigate list
        inoremap <silent><expr> <C-j>
              \ coc#pum#visible() ? coc#pum#next(1) :
              \ CheckBackspace() ? "\<Tab>" :
              \ coc#refresh()
        inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

        " Suggested in example configuration:
        " https://github.com/neoclide/coc.nvim#example-vim-configuration
        set nobackup
        set nowritebackup
        set updatetime=300
        set signcolumn=yes

        " GoTo code navigation.
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> rr <Plug>(coc-rename)
        nmap <silent> ac <Plug>(coc-codeaction)
      '';
    }
    {
      plugin = pkgs.vimPlugins.copilot-vim;
      config = ''
        imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
      '';
    }
  ];
}
