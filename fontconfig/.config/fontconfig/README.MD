# Fontconfig

1. Create a `conf.d` directory in `.config/fontconfig`
2. Copy the desired `.conf` files to the new `conf.d` directory
   ```
   ln -s 80-firacode-stylistic-sets.conf $HOME/.dotfiles/fontconfig/.config/fontconfig/conf.d
   ```

### Fira Code Stylistic Sets

Edit the file to remove any undesired changes
Verify with

```
echo -e '| r |\n| <= >= |\n| & |\n| $ |\n| @ |\n| \\\\ |\n| 0 |\n| 0123456789 |' | pango-view --font="Fira Code" /dev/stdin
```
