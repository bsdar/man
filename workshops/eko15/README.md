# OpenBSD: una workstation segura
## De cero a kernel hacking en 2hs

## Detalles
* Fecha (date): 2019-09-27
* Hora (time): 11:15 - 13:15
* Lugar (place): [Ekoparty security conference 2019](https://ekoparty.org) (eko15) en Ciudad Cultural Konex (Sarmiento 3131, Buenos Aires)
* Speakers: ToscoSys & Anatoli
* Ayudantes: Wen & Pablo Tesarrolo
* Fotos: próximamente!

## Material
1. Slides
   1. Parte 1: [Intro & setup inicial con FDE & firmware](slides/parte_1.pdf)
   2. Parte 2.1: [Administración](slides/parte_2.1_fundamentos.pdf)
   2. Parte 2.2: [i3wm](slides/parte_2.2_i3wm.pdf)
   2. Parte 2.3: Openbox
   2. Parte 2.4: Compilación del kernel
   4. Auxiliar: boot desde un pendrive físico en VMWare ([pdf](aux/vmware_pendrive.pdf), [md](aux/vmware_pendrive.md)) y VirtualBox ([pdf](aux/virtualbox_pendrive.pdf), [md](aux/virtualbox_pendrive.md))
2. Configs
   1. `dotfiles`: archivos de configuración para desplegar en la carpeta del usuario (`~`) con `cp -r dotfiles/xwm/. ~`<br />(limpiar el despliegue con `cd dotfiles/xwm; find . -type f -exec echo rm -rf "$HOME/tmp/homedir/{}" \;` (ejecutar sin `echo` si entendes lo que hace el comando))
      1. para [i3wm](dotfiles/i3wm)
      2. para [Openbox](dotfiles/openbox)
   2. `etc_configs`: nuevos [archivos de configuración](etc_configs) a desplegar en `/etc` con `doas install -o root -g wheel -m 644 etc_configs/file.conf /etc/`
   3. `patches`: [patches](patches) para aplicar a los archivos de configuración existentes en `/etc` con `doas patch -d /etc < patches/file.patch`
   4. `pkglists`: [listas de paquetes](pkglists) para ser usados por `pkg_add -l <proposito.pkglist>` para instalar todos los paquetes necesarios en una operación
3. [Archivos](misc) misceláneos
