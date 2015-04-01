cowboyku_sub_protocol
===================

The `cowboyku_sub_protocol` behaviour defines the interface used
by modules that implement a protocol on top of HTTP.

Types
-----

None.

Callbacks
---------

### upgrade(Req, Env, Handler, Opts)
	-> {ok, Req, Env}
	| {suspend, Module, Function, Args}
	| {halt, Req}
	| {error, StatusCode, Req}

> Types:
>  *  Req = cowboyku_req:req()
>  *  Env = env()
>  *  Handler = module()
>  *  Opts = any()
>  *  Module = module()
>  *  Function = atom()
>  *  Args = [any()]
>  *  StatusCode = cowboyku:http_status()
>
> Upgrade the protocol.
>
> Please refer to the `cowboyku_middleware` manual for a
> description of the return values.
