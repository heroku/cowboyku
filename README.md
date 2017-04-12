# Cowboyku

Cowboy is a small, fast and modular HTTP server written in Erlang.
Cowboyku is a fork of that server used in conjunction with
[vegur](https://github.com/heroku/vegur), Heroku's HTTP proxy library.

It is functionally equivalent to Cowboy 0.10.0, with custom patches added in to
function properly as a proxy's web server (Proxies and HTTP servers have
slightly varying specifications) and parser.

Cowboyku is not expected to be used standalone. It is rather a fork used so
that both Cowboy and Vegur might be used from within the same virtual machine
without holding users of Cowboy back. This allows Heroku to maintain a stable
proxy, upgraded at a pace we judge adequate for the production applications on
our platform, while any user of the proxy might develop interfaces and matching
work on a newer Cowboy version as required.

There is no long-term guarantee this library will be used or maintained.
Depending on developments in the Cowboy servers and Heroku's Routing team
agenda, we might eventually just drop this fork and go back to mainline (or
update it) without further notice.

## A Herokai's Guide to Cowboyku Development

Cowboyku has been updated to run with `rebar3` because that's what the
rest of the stack at Heroku uses, and for the rare occasions that an
update is needed for Cowboyku, it's more trouble than it's worth to
use a completely different build system.

`make test` is kind of racy, and the tests have been polished to try
and eliminate some of them, but it's not perfect.

### Autobahn

The Autobahn suite does something with python to test websockets. It's
disabled by default so you don't waste your life trying to get it
working locally. You can run it with `AUTOBAHN=1 make test` but you'll
probably have to get your local environment in good shape first.

YMMV, but you can try this:

```
pip install -U virtualenv twisted autobahn autobahntestsuite
```

but if that doesn't work, you're on your own.


# Sponsors of the Original project

The SPDY protocol development is sponsored
by [LeoFS Cloud Storage](http://www.leofs.org).

The project is currently sponsored by [Kato.im](https://kato.im/).
