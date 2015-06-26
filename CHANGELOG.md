CHANGELOG
=========

## Cowboyku 1.0.1

- Added proper handling for internal error code 499 (Client disconnected)

## Cowboyku 1.0.0

- Renamed all modules and tests for a proper fork.

## Cowboy 0.6.1.3-heroku

- Hardcoded `recv` reduced from 55s to 1s.

## Cowboy 0.6.1.2-heroku

- Added support for `Connection: keepalive` on a `HEAD` response that would otherwise be close-delimited (and therefore require a forced `connection: close` header)

## Cowboy 0.6.1.1-heroku

- `cowboy_client` modified in some breaking ways, deprecated (vegur has its own fork as `vegur_client`)
- `cowboy_protocol` terminates some badly formatted requests in a 400 rather than silent termination
- `cowboy_req`:
 - ad-hoc keep-alive supported for HTTP/1.0
 - `body_length` may return errors that need to be handled (to return 400s, for example)
 - Removed 100-Continue auto-response support. Feature moved to vegur (which may override it for proxy-specific requirements)
 - hardcoded `recv` timeout raised from 5s to 55s.
 - Added functions to buffer data when the socket is 'borrowed' and read from outside of cowboy
 - Dropped `transfert-encoding: identity` header
 - Forced HTTP/1.1 version in responses at all times (HTTP/1.0 support is still there)
 - Headers are CamelCased by default.

## Cowboy 0.9.0

Taken as-is
