# NixOS Zephyrus Flake

This is a flake-based NixOS configuration (host: `starlord`) for an ASUS ROG Zephyrus laptop with:

- Hyprland and niri, selectable at login via greetd + tuigreet
- noctalia-shell as the niri bar/shell; waybar, rofi, swaync, swww, Quickshell for Hyprland
- NVIDIA + AMD hybrid graphics (NVIDIA PRIME)
- asusd + supergfxd for ASUS ROG control (fan/power profiles, GPU mode switching)
- Gaming & dev tools (Steam, Wine, Lutris, Neovim, GCC/Cargo/Go/Zig/Node, etc.)
- Browsers, chat, and productivity apps (Brave, Chrome, Vivaldi, Vesktop, Obsidian, Teams, etc.)
- Virtualization (libvirtd + virt-manager), Syncthing, and Tailscale
- Flatpak, Pipewire, Bluetooth, and Docker support

## Usage

```bash
nixos-rebuild switch --flake .#starlord
```

