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

A GitHub Action can run `dbwebb-deploy` over SSH with a key restricted to that one command
(`command="sudo /usr/local/sbin/dbwebb-deploy",restrict`), and a sudoers rule that allows only that script.
The host pulls the repo itself (the repo is public), so nothing large is uploaded.
