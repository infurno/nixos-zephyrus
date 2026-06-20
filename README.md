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
- AI/agent tooling: Ollama (local models, system service), Claude Code, Hermes Agent, oh-my-posh

## Usage

```bash
nixos-rebuild switch --flake .#starlord
```

## Fresh install on a new laptop

The USB's `nixos-graphical` ISO only does a **base** NixOS install (partitioning,
bootloader, a default `configuration.nix`, a plain user). This flake replaces
that default config afterward. Do not try to make the graphical installer use
this flake directly — let it finish its normal base install first.

1. **Run the graphical installer** to completion: partition the disk, set your
   timezone/locale, create the `hal` user, and let it install + reboot into the
   minimal base system it generates.

2. **Boot into the new system** and get a root shell (`sudo -i`, or log in as
   root if that's how the installer set it up).

3. **Get this repo onto the machine.** If you used the USB-with-extra-partition
   approach, mount it and `cp -r` the contents somewhere like `/root/nixos-zephyrus`;
   otherwise clone it (you'll need network + either `nix-shell -p git` or `git`
   already present):
   ```bash
   git clone git@github.com:infurno/nixos-zephyrus.git /root/nixos-zephyrus
   ```

4. **Copy over the real hardware config.** The installer already generated a
   correct `hardware-configuration.nix` for *this* machine at
   `/etc/nixos/hardware-configuration.nix` — copy it over the placeholder:
   ```bash
   cp /etc/nixos/hardware-configuration.nix /root/nixos-zephyrus/hardware/starlord.nix
   ```

5. **Verify the NVIDIA PRIME bus IDs** in `hosts/starlord.nix` against this
   machine's actual GPU layout — the values currently in the repo are
   placeholders from older hardware:
   ```bash
   lspci -nnk | grep -E "VGA|3D"
   ```
   Update `hardware.nvidia.prime.amdgpuBusId` / `nvidiaBusId` if they don't match.

6. **Rebuild using the flake** (no need to copy anything into `/etc/nixos` —
   you can build straight from wherever you cloned it):
   ```bash
   cd /root/nixos-zephyrus
   sudo nixos-rebuild switch --flake .#starlord
   ```
   First build will take a while: niri compiles from source unless you add its
   binary cache first (see [niri-flake's README](https://github.com/sodiboo/niri-flake)
   on `niri.cachix.org`).

7. **Reboot.** You'll land on the `tuigreet` session picker — choose Hyprland or
   niri. After logging in, sanity-check `asusctl profile`, `supergfxctl status`,
   and `ollama list` to confirm the ASUS/GPU/AI tooling came up correctly.

