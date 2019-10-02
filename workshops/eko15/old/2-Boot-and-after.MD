# Primeros Pasos

- boot
- login

## Instalar Firmware

```bash
# be root!
su -

fw_update -a

# o desde el mirror de la eko:
fw_update -a -p http://10.10.10.245/firmware/6.5/

# o un path local:
fw_update -a -p /mnt/firmware/

```

## Habilitar doas

