# Dotfiles

Managed home files live under `home/` and are deployed with GNU Stow.

This checkout runs `stow --restow` after each commit. To enable that hook in a
new checkout, run:

```sh
git config core.hooksPath .githooks
```

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
