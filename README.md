# Dotfiles with Home Manager

This repository contains my dotfiles managed using **Home Manager**. It allows me to easily replicate my development environment on different machines.

## 📂 Directory Structure
```
~/dotfiles/
├── home-manager/       # Home Manager configuration
│   ├── home.nix        # Main Home Manager config
│   ├── env.nix         # Environment variables
│   └── ...
├── nvim/               # Neovim configuration
│   ├── init.lua        # LazyVim setup
│   └── ...
├── lazygit/            # Lazygit configuration
│   ├── config.yml      # Lazygit settings
│   └── ...
└── .env                # Environment variables (ignored by Git)
```

## 🚀 Setting Up on a New Machine

### 1️⃣ Install **Home Manager**
If Home Manager is not installed, install it first:
```sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

### 2️⃣ Clone the Dotfiles Repository
```sh
git clone https://github.com/yourusername/dotfiles ~/dotfiles
```

### 3️⃣ Create `env.nix` for Environment Variables
Create `~/dotfiles/home-manager/env.nix` and define your environment variables:
```nix
{
  CODESTATS_API_KEY = "your_api_key_here";
  GITHUB_TOKEN = "your_github_token_here";
}
```
Then, import it in `home.nix`:
```nix
home.sessionVariables = import ./env.nix;
```

### 4️⃣ Symlink Home Manager Configuration
```sh
ln -s ~/dotfiles/home-manager ~/.config/home-manager
```

### 5️⃣ Activate Home Manager Configuration
```sh
home-manager switch
```

## 🛠️ Updating Configuration
Modify `home.nix` or other config files, then run:
```sh
home-manager switch
```

## 🔄 Syncing Across Machines
If you make changes, commit them and push to your Git repository:
```sh
git add .
git commit -m "Update dotfiles"
git push
```
On another machine, pull the changes and run `home-manager switch`.

## 📦 Installing Packages
To install system-wide packages, add them to `home.nix` under `home.packages`:
```nix
home.packages = [
  pkgs.neovim
  pkgs.ripgrep
  pkgs.git
];
```
Then apply changes:
```sh
home-manager switch
```

## 🏗️ Troubleshooting
- **Symlink Issues?** Remove existing directories before linking:
  ```sh
  rm -rf ~/.config/home-manager
  ln -s ~/dotfiles/home-manager ~/.config/home-manager
  ```
- **Home Manager Errors?** Run `home-manager switch --show-trace` to debug.
- **Permission Issues?** Ensure your user owns the config files:
  ```sh
  chown -R $USER:$USER ~/dotfiles
  ```

## 📜 License
MIT License. Feel free to modify and use this setup!

---


