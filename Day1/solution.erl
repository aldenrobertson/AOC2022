-module(solution).
-author("Alden").

-export([
    part1/0,
    part2/0,
    q1_helper/2
]).

part1() ->
    lists:max(lists:foldl(fun q1_helper/2,[0], readlines("input.txt"))).

part2() ->
    [X,Y,Z|_Rest] = 
    lists:reverse(lists:sort(lists:foldl(fun q1_helper/2,[0], readlines("input.txt")))),
    X + Y + Z.

q1_helper(<<>>, [_Recent|_Rest]) ->
    [0|[_Recent|_Rest]];
q1_helper(X, [Recent|_Rest]) ->
    [(binary_to_integer(X)) + Recent|[Recent|_Rest]].
    
readlines(FileName) ->
    {ok, Data} = file:read_file(FileName),
    binary:split(Data, [<<"\n">>], [global]).