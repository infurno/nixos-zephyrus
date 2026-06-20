# NixOS Zephyrus G14 Flake

This is a flake-based NixOS configuration for the ASUS ROG Zephyrus G14 GA403WR with:

- Hyprland + Quickshell
- NVIDIA 5070 Ti + AMD 890M hybrid graphics
- Gaming & dev tools (Steam, Wine, Lutris, Neovim, etc.)
- Flatpak, Pipewire, Bluetooth, and Docker support

## Usage

```bash
nixos-rebuild switch --flake .#starlord

