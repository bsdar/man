# Instalacion en VirtualBox con imagen installXX.fs

## Guia probada con VirtualBox 6.0 en Linux x64

Para poder usar la imagen .fs en vez del .iso para CD cambiamos algunas cosas:

- creamos un descriptor del disco para virtualbox
- montamos el descriptor del pendrive como un disco SATA
- activamos UEFI

## Descargar imagen

Descargar installXX.fs [amd64] desde <https://www.openbsd.org/faq/faq4.html#Download>

Que en la version actual 6.5 seria <https://cdn.openbsd.org/pub/OpenBSD/6.5/amd64/install65.fs>

## Crear disco virtual (.vmdk) para VirtualBox

Es un wraper del archivo install65.fs.
Mas info en <https://www.virtualbox.org/manual/ch09.html>

```bash
vboxmanage internalcommands createrawvmdk -filename ~/install65.fs.vmdk -rawdisk ~/Downloads/install65.fs
```
<div style="page-break-after: always;"></div>

## Crear Maquina Virtual


![vbox image](capturas/5.0-new.png)

<div style="page-break-after: always;"></div>

## Casi como calquier otra: New, nombre, ram...

![vbox image](capturas/5.1-naming.png)

![vbox image](capturas/5.2-ram-size.png)

<div style="page-break-after: always;"></div>

## Crearle un disco

![vbox image](capturas/5.3.0-hdd-create.png)

![vbox image](capturas/5.3.0-hdd-type.png)

![vbox image](capturas/5.3.2-hdd-dynamic.png)

<div style="page-break-after: always;"></div>

## Recordar el tamaño para identificarlo luego

![vbox image](capturas/5.3.3-hdd-location.png)

<div style="page-break-after: always;"></div>

## Resumen de la Maquina

![vbox image](capturas/5.4-summary.png)

## Ahora hacemos algunas modificaciones

### Activar EFI en SYSTEM, MOTHERBOARS

![vbox image](capturas/5.5.0-efi.png)

<div style="page-break-after: always;"></div>

## Cambiar la memoria de video a 4 MB

### para mitigar un inconveniente con la resolucion 

![vbox image](capturas/5.5.1-display-4m.png)

<div style="page-break-after: always;"></div>

## Agregar el disco de instalacion como un disco SATA en un controlador SATA

### Agregar el controlador SATA

![vbox image](capturas/5.6.0-storage-0.png)

<div style="page-break-after: always;"></div>

## Agregar el DISCO SATA

![vbox image](capturas/5.6.1-storage+SATA-controller.png)

<div style="page-break-after: always;"></div>

## Elejir el boton "un disco existente"

![vbox image](capturas/5.6.1.5-add-SATA-disk.png)

<div style="page-break-after: always;"></div>

## Nos muestra los discos registrados en VirtualBox, presionar el boton "Add"

![vbox image](capturas/5.6.2-disk-selector.png)

<div style="page-break-after: always;"></div>

## Y buscar el descriptor .vmdk que  generamos al principio

![vbox image](capturas/5.6.3-disk-selector-add.png)

<div style="page-break-after: always;"></div>

## Ahora aparece registrado, selecionarlo

![vbox image](capturas/5.6.4-disk-selector-confirm.png)

<div style="page-break-after: always;"></div>

## Asi queda colgando del controlador SATA

![vbox image](capturas/5.6.5-storage-1.png)

<div style="page-break-after: always;"></div>

## Finalmente aparece en el resumen de la maquina

![vbox image](capturas/5.7-summary.png)
