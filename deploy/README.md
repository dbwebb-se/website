# Deploy dbwebb.se to a container host

`Dockerfile` builds the site (Anax on PHP 8.4, Apache) as an image. `dbwebb-deploy` builds it on the
host and restarts the container hardened (read-only root, no capabilities, memory and pid limits).
Caddy on the host terminates TLS and proxies to `127.0.0.1:8282`.

- Submodules (`htdocs/repo/*`, `htdocs/forum`, `htdocs/lab`) are not used and are left out, see `.dockerignore`.
- `cache/anax` is a tmpfs seeded with the content index that was built together with the image
  (the equivalent of `make warm-cache`). The index is never invalidated, so content changes need a new image.
- `cache/cimage` is the named volume `dbwebb-cimage` (generated images, survives deploys).
- Vendor fixes done in the Dockerfile: Anax 404 handling on PHP 8, cimage production mode and no `pngout`.

## Install on the host (once)

    sudo install -d /srv/dbwebb
    sudo git clone --depth 1 https://github.com/dbwebb-se/website.git /srv/dbwebb/src
    sudo install -o root -g root -m 755 deploy/dbwebb-deploy /usr/local/sbin/dbwebb-deploy
    sudo dbwebb-deploy

The Caddy site for the container is a plain `reverse_proxy 127.0.0.1:8282`.

## Continuous deploy

On push to master, `.github/workflows/deploy.yml` builds the image on GitHub, pushes it to
`ghcr.io/dbwebb-se/website:<sha>` (and `:latest`) and runs `dbwebb-deploy <sha>` on the host over SSH, which pulls
that image and restarts the container (with rollback). The package must be **public** so the host can pull without a token
(the repo is public too, and the image holds nothing that is not in the repo).

The SSH key is restricted to `command="/usr/local/bin/dbwebb-deploy-ssh",restrict`, a wrapper that only accepts a
40 character commit sha, and a sudoers rule allows the deploy user to run only `/usr/local/sbin/dbwebb-deploy`:

    sudo install -o root -g root -m 755 deploy/dbwebb-deploy /usr/local/sbin/dbwebb-deploy
    sudo install -o root -g root -m 755 deploy/dbwebb-deploy-ssh /usr/local/bin/dbwebb-deploy-ssh

`dbwebb-deploy` without arguments still builds on the host from a fresh clone, as a fallback.
