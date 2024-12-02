{ pkgs, ... }:
let 
  tmux-nvim = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "aserowy";
      repo = "tmux.nvim";
    };
  };
in
{
  # programs.foot = {
  #   enable = true;
  # };
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    prefix = "C-space";
    mouse = true;
    keyMode = "vi";
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      # tmux-nvim
    ];
    extraConfig = '' # set -g allow-passthrough set -g status off
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?\.?(view|n?vim?x?)(-wrapped)?(diff)?$'"

      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' ''' 'select-pane -L' }
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' ''' 'select-pane -D' }
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' ''' 'select-pane -U' }
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' ''' 'select-pane -R' }

      bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' ''' 'select-pane -L'
      bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' ''' 'select-pane -D'
      bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' ''' 'select-pane -U'
      bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' ''' 'select-pane -R'


      
      bind -n 'M-h' if-shell "$is_vim" 'send-keys M-h' 'resize-pane -L 1'
      bind -n 'M-j' if-shell "$is_vim" 'send-keys M-j' 'resize-pane -D 1'
      bind -n 'M-k' if-shell "$is_vim" 'send-keys M-k' 'resize-pane -U 1'
      bind -n 'M-l' if-shell "$is_vim" 'send-keys M-l' 'resize-pane -R 1'

      bind-key -T copy-mode-vi M-h resize-pane -L 1
      bind-key -T copy-mode-vi M-j resize-pane -D 1
      bind-key -T copy-mode-vi M-k resize-pane -U 1
      bind-key -T copy-mode-vi M-l resize-pane -R 1
      set -g allow-passthrough all

      # Update envvars so hyprctl works ( Will check later )
      # set -ga update-environment DISPLAY
      # set -ga update-environment HYPRLAND_INSTANCE_SIGNATURE
      # set -ga update-environment HYPRLAND_CMD
      # set -ga update-environment WAYLAND_DISPLAY
      # set -ga update-environment SWAYSOCK
      # set -ga update-environment I3SOCK


      set -sa terminal-features 'foot*:sixel:sync:RGB:256:hyperlinks'
      set -gq input-buffer-size 10485760
    '';
  };
}
