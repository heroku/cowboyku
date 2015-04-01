%% Feel free to use, reuse and abuse the code in this file.

-module(http_chunked).
-behaviour(cowboyku_http_handler).
-export([init/3, handle/2, terminate/3]).

init({_Transport, http}, Req, _Opts) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{ok, Req2} = cowboyku_req:chunked_reply(200, Req),
	timer:sleep(100),
	cowboyku_req:chunk("chunked_handler\r\n", Req2),
	timer:sleep(100),
	cowboyku_req:chunk("works fine!", Req2),
	{ok, Req2, State}.

terminate(_, _, _) ->
	ok.
