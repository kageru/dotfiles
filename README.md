# Dotfiles

Managed home files live under `home/` and are deployed with GNU Stow.

From this repository, run:

```sh
stow --target="$HOME" home
```

After adding or removing managed paths, update the links with:

```sh
stow --restow --target="$HOME" home
```

To remove the deployed links, run:

```sh
stow --delete --target="$HOME" home
```
