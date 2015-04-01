The Cowboyku Application
======================

Small, fast, modular HTTP server.

Dependencies
------------

The `cowboyku` application uses the Erlang applications `ranch`
for listening and accepting TCP connections, and `crypto`
for establishing Websocket connections. These dependencies must
be loaded for the `cowboyku` application to work. In an embedded
environment this means that they need to be started with the
`application:start/{1,2}` function before the `cowboyku`
application is started.

The `cowboyku` application also uses the Erlang applications
`asn1`, `public_key` and `ssl` when listening for HTTPS connections.
These are started automatically if they weren't before.

Environment
-----------

The `cowboyku` application does not define any application
environment configuration parameters.
