#!/usr/bin/env bash
sleep 1
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
dbus-update-activation-environment --systemd --all
systemctl --user import-environment QT_QPA_PLATFORMTHEME
systemctl --user restart xdg-desktop-portal-hyprland
sleep 2
systemctl --user restart xdg-desktop-portal
