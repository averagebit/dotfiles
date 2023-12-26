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
          clippy
          curl
          delve
          direnv
          exiftool
          fd
          fluxcd
          foot
          fuzzel
          fzf
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
          inxi
          jq
          k9s
          kind
          kubeconform
          kubectl
          kustomize
          lazygit
          libredwg
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
          p7zip
          packer
          pandoc
          pavucontrol
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
          tz
          unrar
          unzip
          ventoy
          vhs
          vial
          vscode
          weechat
          wget
          whois
          wl-clipboard
          yq
          yt-dlp
          ytfzf
          zathura
          zip
        ];
        # pathsToLink = [ "/bin" "/share" ];
      };
    };
}
