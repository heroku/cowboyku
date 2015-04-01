%% Feel free to use, reuse and abuse the code in this file.

-module(http_loop_recv).
-behaviour(cowboyku_loop_handler).
-export([init/3, info/3, terminate/3]).

init({_, http}, Req, _) ->
	self() ! recv_timeout,
	{loop, Req, undefined, 500, hibernate}.

info(recv_timeout, Req, State) ->
	{ok, Body, Req1} = cowboyku_req:body(Req),
	100000 = byte_size(Body),
	{ok, Req2} = cowboyku_req:reply(200, Req1),
	{ok, Req2, State}.

terminate({normal, shutdown}, _, _) ->
	ok.
