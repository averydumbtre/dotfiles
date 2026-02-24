
### olddd

### git clone https://gitgud.io/wackyideas/aerothemeplasma.git aerothemeplasma
### cd aerothemeplasma
### chmod +x compile.sh && ./compile.sh --wayland --ninja
### chmod +x install_plasmoids.sh && ./install_plasmoids.sh --wayland
### chmod +x install_kwin_components.sh && ./install_kwin_components.sh --wayland
### chmod +x install_plasma_components.sh && ./install_plasma_components.sh --wayland
### chmod +x install_misc_components.sh && ./install_misc_components.sh --wayland

sudo pacman -S git cmake extra-cmake-modules ninja curl unzip qt6-virtualkeyboard qt6-multimedia qt6-5compat qt6-wayland plasma-wayland-protocols plasma5support kvantum sddm sddm-kcm base-devel plasma-nm plasma-pa plasma-workspace plasma-desktop kwin-x11 plasma-x11-session
git clone https://gitgud.io/wackyideas/aerothemeplasma.git aerothemeplasma
cd aerothemeplasma
chmod +x install.sh && ./install.sh
