{ config, pkgs, ... }:

{

  programs = {

    git = {
      enable = true;
      # package = pkgs.gitAndTools.gitFull;
      # delta = { enable = true; };
      signing = {
         key = "58BFCAEC8B1CCA79209F9776C363B63341FC23BB";
         signByDefault = true;
      };
      userEmail = "matthias@bespinian.io";
      userName = "Matthias Osswald";
    };

    zsh = {
      enable = true;
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
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
      ];
#      configure = {
#        customRC = ''
#          set number
#          set cc=80
#        '';
#        packages.myVimPackage = with pkgs.vimPlugins; {
#          start = [
#	    nerdtree
#	  ];
#        };
#      };
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

  };

}
