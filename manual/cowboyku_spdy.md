cowboyku_spdy
===========

The `cowboyku_spdy` module implements SPDY/3 as a Ranch protocol.

Types
-----

### opts() = [{env, cowboyku_middleware:env()}
	| {middlewares, [module()]}
	| {onrequest, cowboyku:onrequest_fun()}
	| {onresponse, cowboyku:onresponse_fun()}]

> Configuration for the SPDY protocol handler.
>
> This configuration is passed to Cowboyku when starting listeners
> using the `cowboyku:start_spdy/4` function.
>
> It can be updated without restarting listeners using the
> Ranch functions `ranch:get_protocol_options/1` and
> `ranch:set_protocol_options/2`.

Option descriptions
-------------------

The default value is given next to the option name.

 -  env ([{listener, Ref}])
   -  Initial middleware environment.
 -  middlewares ([cowboyku_router, cowboyku_handler])
   -  List of middlewares to execute for every requests.
 -  onrequest (undefined)
   -  Fun called every time a request is received.
 -  onresponse (undefined)
   -  Fun called every time a response is sent.

Exports
-------

None.
