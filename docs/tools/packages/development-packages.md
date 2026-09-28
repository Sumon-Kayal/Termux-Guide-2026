# Development & Optional Packages

These packages provide advanced functionality but aren't required for basic use:

```bash
pkg install -y \
  iproute2 bash-completion perl \
  mount-utils autoconf automake \
  bison flex libtool m4 pcre \
  silversearcher-ag apache2 apr apr-util \
  fish libxslt python-lxml python-tkinter

# Cleanup
pkg update -y && pkg upgrade -y
apt clean && pkg clean && pkg autoclean && apt autoremove -y
```

**Use cases:**
- **Development:** autoconf, automake, libtool
- **Shells:** fish (modern shell alternative)
- **Web:** apache2 (web server)
- **Search:** silversearcher-ag (fast code search)

## Self-Hosting & Networking Stack

For running git servers, tunnels, and reverse proxies directly on-device:

```bash
pkg install -y \
  tor which mandoc deno \
  cloudflared nginx caddy \
  tmux dnsutils golang openssl-tool \
  gitea forgejo
```

**What each one is for:**
- **tor** — Tor client; needed for hidden-service-based self-hosting without a public IP
- **which** — locates binaries in `$PATH` (small POSIX utility, often assumed present but isn't by default)
- **mandoc** — man page compiler/viewer; Termux doesn't ship man pages by default, this adds support
- **deno** — secure-by-default JS/TS runtime, alternative to Node.js for scripts and linting
- **cloudflared** — Cloudflare Tunnel client; exposes a local server through a stable URL without port-forwarding
- **nginx / caddy** — reverse proxies / static web servers (Caddy auto-handles TLS; nginx is the lighter-weight classic choice)
- **tmux** — terminal multiplexer; keeps sessions alive across disconnects, panes/windows in one Termux session
- **dnsutils** — `dig`, `nslookup`, and friends for DNS debugging
- **golang** — Go toolchain
- **openssl-tool** — CLI for certs, hashing, and encryption (separate from the `openssl` library package)
- **gitea / forgejo** — lightweight self-hosted Git servers (Forgejo is the community-driven Gitea fork)

> **Security Warning:**
> - **Bind services to 127.0.0.1** unless you intentionally need external access. Services like nginx, caddy, and gitea default to listening on all interfaces, which can expose them to your local network.
> - **Use strong authentication** for Gitea/Forgejo admin accounts. These services are designed for production use and should never have weak or default credentials.
> - **Cloudflare Tunnel exposes your device to the internet.** Only use cloudflared if you understand that it creates a public tunnel through Cloudflare's network to your local service.
> - **Note:** Forgejo may not be available in default Termux repos on all architectures. If `pkg install forgejo` fails, you'll need to build it from source or use Gitea instead.

---
