{ config, pkgs, ... }:

{

  programs = {

    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      signing = {
         key = "58BFCAEC8B1CCA79209F9776C363B63341FC23BB";
         signByDefault = true;
      };
      userEmail = "matthias@bespinian.io";
      userName = "Matthias Osswald";
      ignores = [
        ".idea" ".vscode" ".DS_Store" ".envrc" "shell.nix" "*.swp" "*.swo"
        "nohup.out" "tags" "tags.lock" "tags.temp" ".direnv"
      ];
      extraConfig = {
        core = {
          pager = "delta --line-numbers --dark --side-by-side";
          editor = "nvim";
          whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        };
        format = {
          pretty = "%C(blue)%h%Creset %s %C(green)%d%Creset [%C(red)%an%Creset, %C(cyan)%cr%Creset] %C(bold reverse)%N%Creset";
        };
        branch = {
          autosetuprebase = "always";
        };
      };
    };

    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "aws" "git" "terraform" "vi-mode" "thefuck" "sudo" ];
        theme = "agnoster";
      };
    };

    neovim = {
      enable = true;
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
        {
          plugin = pkgs.vimPlugins.coc-nvim;
          config = ''
            let g:coc_global_extensions = [
              \ 'coc-pyright',
              \ 'coc-tsserver',
              \ 'coc-vetur',
              \ 'coc-clangd',
              \ 'coc-rust-analyzer',
              \ 'coc-yaml',
              \ ]

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
            " Symbol renaming.
            nmap <leader>rn <Plug>(coc-rename)
            " Remap keys for applying codeAction to the current buffer.
            nmap <leader>ac  <Plug>(coc-codeaction)
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
    };

    tmux = {
      enable = true;
      escapeTime = 10;
      terminal = "tmux-256color";
      extraConfig = ''
        # remap prefix from 'C-b' to 'C-a'
        unbind C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix

        # split panes using | and -
        bind | split-window -h
        bind - split-window -v
        unbind '"'
        unbind %

        # Enable mouse mode (tmux 2.1 and above)
        set -g mouse on

        # don't rename windows automatically
        set-option -g allow-rename off

        # reload config with `r`
        bind r source-file ~/.tmux.conf

        # Start window and pane indices at 1.
        set -g base-index 1
        set -g pane-base-index 0

        # Set the history limit so we get lots of scrollback.
        setw -g history-limit 4000000
      '';
    };

    alacritty = {
      enable = true;
      settings = {
        window = {
          startup_mode = "Maximized";
        };
        scrolling = {
          history = 100000;
        };
        font = {
          size = 13.0;
        };
        live_config_reload = true;
        colors = {
          primary = {
            background = "0x1c1c1c";
            foreground = "0x808080";
          };
          cursor = {
            text = "0x1c1c1c";
            cursor = "0x808080";
          };
          normal = {
            black = "0x1c1c1c";
            red = "0xaf005f";
            green = "0x5faf00";
            yellow = "0xd7af5f";
            blue = "0x5fafd7";
            magenta = "0x808080";
            cyan = "0xd7875f";
            white = "0xd0d0d0";
          };
          bright = {
            black = "0x585858";
            red = "0x5faf5f";
            green = "0xafd700";
            yellow = "0xaf87d7";
            blue = "0xffaf00";
            magenta = "0xffaf00";
            cyan = "0x00afaf";
            white = "0x5f8787";
          };
        };
      };
    };

  };

}
