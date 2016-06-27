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

make_header_pairs() ->
    HeadersCt = random:uniform(3) + 2,
    [begin
         ValLen = random:uniform(10) + 10,
         {make_header(), crypto:rand_bytes(ValLen)}
     end
     || _ <- lists:seq(1, HeadersCt)].


make_requests(N) ->
    ReqData =
        [{make_header_pairs(),
          crypto:rand_bytes(random:uniform(200)+100)}
         || _ <- lists:seq(1, N)],
    {Time, _} =
        timer:tc(fun() ->
                         [{ok, 200, _, _} =
                              hackney:request(post, "http://localhost:8080/",
                                              Headers,
                                              <<>>, [])
                          || {Headers, _Body} <- ReqData]
                 end),
    io:format("total time for ~p requests: ~p ms~n", [N, Time/1000]).
