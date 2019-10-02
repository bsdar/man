# OpenBSD: una workstation segura
## De cero a kernel hacking en 2hs

## Detalles
* Fecha (date): 2019-09-27
* Hora (time): 11:15 - 13:15
* Lugar (place): [Ekoparty security conference 2019](https://ekoparty.org) (eko15) en Ciudad Cultural Konex (Sarmiento 3131, Buenos Aires)
* Speakers: ToscoSys & Anatoli
* Ayudantes: Wen & Pablo Tesarrolo
* [Fotos](xxx)

## Material
1. Slides
   1. Parte 1: [Intro & setup inicial con FDE & firmware](20190827.md)
   2. Parte 2.1: [Administración](20190827.md)
   2. Parte 2.2: [i3wm](20190827.md)
   2. Parte 2.3: Openbox
   2. Parte 2.4: Compilación del kernel
   4. Auxiliar: arranque desde un pendrive físico en VMWare ([pdf](aux/vmware_pendrive.pdf), [md](aux/vmware_pendrive.md)) y VirtualBox ([pdf](aux/virtualbox_pendrive.pdf), [md](aux/virtualbox_pendrive.md))
2. Configs
   1. `dotfiles`: archivos de configuración para desplegar en la carpeta del usuario (`~`) con `cp -r dotfiles/xwm/. ~`<br />(limpiar el despliegue con `cd dotfiles/xwm; find . -type f -exec echo rm -rf "$HOME/tmp/homedir/{}" \;` (borrar `echo` si estás seguro lo que hace el comando))
      1. for [i3wm](dotfiles/i3wm) setup
      2. for [Openbox](dotfiles/openbox) setup
   2. `etc_configs`: new [config files](etc_configs) to be placed to `/etc` with `doas install -o root -g wheel -m 644 etc_configs/file.conf /etc/`
   3. `patches`: [patches](patches) to be applied to existing configs in `/etc` with `doas patch -d /etc < patches/file.patch`
   4. `pkglists`: [package lists](pkglists) to be used by `pkg_add -l <proposito.pkglist>` to install all necessary packages in one go
3. [Archivos](misc) misceláneos
