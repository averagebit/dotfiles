{
  allowUnfree = true;
  packageOverrides = pkgs:
    with pkgs; {
      user = pkgs.buildEnv {
        name = "user-packages";
        paths = [
          age
          awscli2
          bind
          bitwarden-cli
          cargo
          chezmoi
          cinnamon.nemo
          clippy
          curl
          delve
          direnv
          fd
          fluxcd
          foot
          fuzzel
          fzf
          gammastep
          gcc
          gh
          git
          git-lfs
          gnumake
          go
          goaccess
          gzip
          hadolint
          helm
          htop
          jq
          kind
          kubeconform
          kubectl
          kustomize
          lazygit
          lm_sensors
          lsof
          lynx
          mako
          mpv
          neofetch
          neovim
          netlify-cli
          nettools
          nix-direnv
          nixfmt
          nmap
          nodejs
          packer
          pandoc
          pciutils
          perl
          podman
          podman-compose
          pulumi-bin
          ripgrep
          rsync
          rust-analyzer
          rustc
          rustfmt
          shellcheck
          smartmontools
          sops
          sshpass
          stack
          strace
          stylua
          swayimg
          sysfsutils
          terraform
          tmux
          traceroute
          tree
          tree-sitter
          ttyper
          unrar
          unzip
          ventoy
          vhs
          vscode
          waybar
          weechat
          wget
          whois
          wl-clipboard
          yq
          ytfzf
          zathura
          zip
        ];
        # pathsToLink = [ "/bin" "/share" ];
      };
    };
}
