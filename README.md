# Dotfiles with Home Manager

This repository contains my dotfiles managed using **Home Manager**. It allows me to easily replicate my development environment on different machines.

## 📂 Directory Structure
```
~/dotfiles/
├── home-manager/       # Home Manager configuration
│   ├── setups/         # nix files for programs
│   ├── home.nix        # Main Home Manager config
│   └── ...
├── nvim/               # Neovim configuration
│   ├── init.lua        # LazyVim setup
│   └── ...
├── lazygit/            # Lazygit configuration
│   ├── config.yml      # Lazygit settings
│   └── ...
├── .env.nix            # Environment variables (gitignored)
└── .secret.alias.nix   # Additional shell alias (gitignored)
```

## 🚀 Setting Up on a New Machine

### 1️⃣ Prepare required package
If Nix and Home Manager is not installed, install it first:
```sh
sh <(curl -L https://nixos.org/nix/install) --daemon

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

### 2️⃣ Clone the Dotfiles Repository
```sh
git clone https://github.com/yourusername/dotfiles dotfiles
```

### 3️⃣ Create `env.nix` for Environment Variables
Create `~/dotfiles/env.nix` and define your environment variables:
```nix
{
  CODESTATS_API_KEY = "your_api_key_here";
  GITHUB_USERNAME = "your_github_username_here";
  GITHUB_EMAIL = "your_github_email_here";
}
```

#### 💡 Optional: Add `secret.alias.env`
```nix
{
  "open-ssh" = "cmd to connect ssh";
}
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
or if its conflicting with your system

```sh
home-manager switch -b backup
```


## 🔄 Syncing Across Machines
If you make changes, commit them and push to your Git repository:
```sh
git add .
git commit -m "Update dotfiles"
git push
```
On another machine, pull the changes and run `home-manager switch`.

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


