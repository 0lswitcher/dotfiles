<p align="center">
  <img src="https://raw.githubusercontent.com/0lswitcher/dotfiles/refs/heads/main/md-assets/nixos/nixos.png" style="width: 256px; height: 256px">
</p>

<h1 align="center">
  NixOS configuration files
</h2>

Yo, welcome to my NixOS configuration files. Below I've included details for the structure of this directory so you can have a better idea of what you're looking at. 

Each name is a seperate machine within my homelab using NixOS as its operating system.

<details>
  <summary>Smith</summary>
  This directory includes the configuration.nix file for Smith, a headless laptop (a.k.a "halftop") that is currently being utilized as a server. This configuration file is more focused on network security and stability rather than cool packages.
</details>

<details>
  <summary>Oracle</summary>
  This directory includes the configuration.nix file for Oracle, a hand-built desktop that serves as my workhorse pc. Secondary server for the more resource intensive services like machine learning, mc-servers, and LLM's. This is my daily machine that I use for browsing, scripting, and gaming so the majority of the "fun" packages are held here.
</details>


<details>
  <summary>Neo</summary>
  This directory includes the configuration.nix file for Neo, a laptop that serves as my on-the-go workstation. Configured more for laptop use, and works great in tandem with my wayland/hyprland waybar config for Neo that contains laptop-specific things like a battery life indicator.
</details>

>  [!IMPORTANT]
>  Neo's configuration file needs quite a bit of updating since it's out of date, so hang tight while I clean things up and I'll add it when I can :)
---

:rage3: I LOVE NIXOS!! :rage3:
