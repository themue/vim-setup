# vim-setup

Small project for the initial setup and maintenance of my vim environment.

* `setup-vim.sh` installs `.vimrc`, the color scheme, and `vim-plug`
* `update-vim.sh` updates `.vimrc` and the colors

Setup only has to be called once, update each time the configuration
or the configured plugs are chanhging. The plugs are updated calling
`:PlugUpdate` inside of vim.
