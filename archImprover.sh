#!/usr/bin/env bash
# Impwoves youw tewminal in evewy way pawsible! uwu   
# AWCH WINUX OWNY!!!!!!

set -euo pipefail

# Check for --noconfirm
NOCONFIRM=false
if [[ "${1:-}" == "--noconfirm" ]]; then
    NOCONFIRM=true
fi

# Banner
echo "  _    _          _    _ _  __       "
echo " | |  | |        | |  | (_)/ _|      "
echo " | |  | |_      _| |  | |_| |_ _   _ "
echo " | |  | \ \ /\ / / |  | | |  _| | | |"
echo " | |__| |\ V  V /| |__| | | | | |_| |"
echo "  \____/  \_/\_/  \____/|_|_|  \__, |"
echo "                                __/ |"
echo "                               |___/ -- Pwobabwy not copywight, Pugsby 2026"
echo "Impwoves youw tewminal in evewy way pawsible! uwu"

# Confirmation
if ! $NOCONFIRM; then
    read -rp "Are you suwe you want to impwove youw tewminal? Uwu? (y/n) " CONFIRM
    if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
        echo "Abowting... :3"
        exit 0
    fi
fi

# Instaww dependencies owo
echo "Instawwing dependencies..."
sudo pacman -S --needed git lolcat uwufetch --noconfirm

# Instaww uwucat nya
echo "Instawwing uwucat..."
TMPDIR=$(mktemp -d)
git clone https://github.com/Pugsby/uwucat.git "$TMPDIR/uwucat"
chmod +x "$TMPDIR/uwucat/uwucat"
sudo mv "$TMPDIR/uwucat/uwucat" /bin/uwucat
rm -rf "$TMPDIR"

# Backup old shell configs
echo "Modifying shell configs..."
[[ -f ~/.bashrc ]] && cp ~/.bashrc ~/.bashrc.bak
[[ -f ~/.zshrc ]] && cp ~/.zshrc ~/.zshrc.bak
[[ -f ~/.config/fish/config.fish ]] && cp ~/.config/fish/config.fish ~/.config/fish/config.fish.bak

# Modify shell configs
grep -qxF 'if [[ -z "$UWUCAT_WRAPPED" ]]; then export UWUCAT_WRAPPED=1; exec > >(uwucat | lolcat) 2>&1; fi' ~/.bashrc || \
    echo 'if [[ -z "$UWUCAT_WRAPPED" ]]; then export UWUCAT_WRAPPED=1; exec > >(uwucat | lolcat) 2>&1; fi' >> ~/.bashrc

grep -qxF 'if [[ -z "$UWUCAT_WRAPPED" ]]; then export UWUCAT_WRAPPED=1; exec > >(uwucat | lolcat) 2>&1; fi' ~/.zshrc || \
    echo 'if [[ -z "$UWUCAT_WRAPPED" ]]; then export UWUCAT_WRAPPED=1; exec > >(uwucat | lolcat) 2>&1; fi' >> ~/.zshrc

mkdir -p ~/.config/fish
grep -qxF 'if not set -q UWUCAT_WRAPPED; set -gx UWUCAT_WRAPPED 1; exec script -q /dev/null | uwucat | lolcat; end' ~/.config/fish/config.fish || \
    echo 'if not set -q UWUCAT_WRAPPED; set -gx UWUCAT_WRAPPED 1; exec script -q /dev/null | uwucat | lolcat; end' >> ~/.config/fish/config.fish

# Replace fastfetch/neofetch with uwufetch
echo "Replacing fastfetch and neofetch with uwufetch..."
sudo pacman -R fastfetch neofetch --noconfirm || true
sudo cp /bin/uwufetch /bin/fastfetch
sudo cp /bin/uwufetch /bin/neofetch

echo "Congwats!!! Youw system is a miwwion times bettew!!!! uwu"

