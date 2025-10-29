yay -S plasma-meta
pacman -S git cmake extra-cmake-modules ninja curl unzip qt6-virtualkeyboard qt6-multimedia qt6-5compat plasma-wayland-protocols plasma5support kvantum base-devel
git clone https://gitgud.io/wackyideas/aerothemeplasma.git aerothemeplasma
cd aerothemeplasma
chmod +x compile.sh && ./compile.sh --wayland --ninja
chmod +x install_plasmoids.sh && ./install_plasmoids.sh --wayland
chmod +x install_kwin_components.sh && ./install_kwin_components.sh --wayland
chmod +x install_plasma_components.sh && ./install_plasma_components.sh --wayland
chmod +x install_misc_components.sh && ./install_misc_components.sh --wayland

