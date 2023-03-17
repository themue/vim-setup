# vim-setup

Small project for the initial setup and maintenance of my vim environment.

* `setup-vim.sh` installs `.vimrc`, the color scheme, and `vim-plug`
   1. The argument `dev` installs a Go development focussed configuration
   1. The argument `adm` installs an administration focussed configuration
* `update-vim.sh` updates `.vimrc` and the colors

After installation you have to call `:PlugInstall` inside of vim to install
all configured plugins. In case of the development focussed configuration
you also have to call `:GoInstallBinaries` to install all the tools `vim-go`
is using.

Later for updating call `:PlugUpgrade` from time to time. It updates the
plugin manager itself. To update the plugins call `:PlugUpdate`. And for
the development variant `GoUpdateBinaries` again.

Enjoy.
