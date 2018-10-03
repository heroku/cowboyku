-module(bench).

-compile(export_all).

bench(Fun, BinaryList) ->
    {Time, _} =
        timer:tc(fun() ->
                         [try Fun(B)
                          catch _:_ ->
                                  io:format("err: ~p", [B])
                          end
                          || B <- BinaryList]
                 end),
    Time / 100000.

make_headers(N) ->
    random:seed(now()),
    [make_header() || _ <- lists:seq(1, N)].

make_header() ->
    Len = random:uniform(3),
    iolist_to_binary([rand_word(N, Len)
                      || N <- lists:seq(1, Len)]).

rand_word(Pos, Len) ->
    End =
        case Pos of
            Len ->
                $:;
            _ ->
                $-
        end,
    [rand_letter()
     || _ <- lists:seq(1, 7)] ++ [End].

rand_letter() ->
    case random:uniform(2) of
        1 ->
            random:uniform($z - $a) + $a;
        _ ->
            random:uniform($Z - $A) + $A
    end.

%% 17> erlang:garbage_collect(), bench:bench(fun(X) -> cowboyku_protocol:match_eol(X, 0) end, bench:make_strs(10000, 1000)).
%% 1.07151
%% 18> erlang:garbage_collect(), bench:bench(fun(X) -> binary:match(X, <<$\n>>) end, bench:make_strs(10000, 1000)).
%% 0.77457
%% 19> erlang:garbage_collect(), bench:bench(fun(X) -> binary:match(X, <<$\n>>) end, bench:make_strs(10000, 4000)).
%% 2.28912
%% 20> erlang:garbage_collect(), bench:bench(fun(X) -> cowboyku_protocol:match_eol(X, 0) end, bench:make_strs(10000, 4000)).
%% 3.82898

rand_str(Len) ->
    End =
        case random:uniform(2) of
            1 ->
                $\n;
            _ ->
                $n
        end,
    iolist_to_binary([rand_letter()
                      || _ <- lists:seq(1, Len)]
                     ++ [End]).

make_strs(N, L) ->
    [rand_str(L)
     || _ <- lists:seq(1, N)].
