# Matlab tips

## Countermeasure for Gtk error
```shell
Gtk-Message: 00:16:09.530: Failed to load module "canberra-gtk-module"
```

```shell
sudo apt install libcanberra-gtk-module
export GTK_PATH=/usr/lib/x86_64-linux-gnu/gtk-2.0/
```
