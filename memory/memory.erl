-module(memory).

-export([get_json/0]).
-export([get_json/1]).

get_json() ->
    Mem = erlang:memory(),
    {ok, jsfw_json:encode([[format(Type), format(M)] || {Type, M} <- Mem])}.

get_json(Arg) ->
    {ok, jsfw_json:encode(Arg)}.

format(Bytes) when is_integer(Bytes) ->
    {Value, Unit} = human_readable(Bytes),
    iolist_to_binary(io_lib:format("~s ~s", [Value, Unit]));
format(Type) when is_atom(Type) ->
    LC = re:split(atom_to_list(Type), "_", [{return, list}]),
    UC = [string:to_upper([C]) ++ Rest || [C|Rest] <- LC],
    string:join(UC, " ").

human_readable(Bytes) when Bytes > 1000000000 -> 
    {format_float(Bytes / 1000000000), "GB"};
human_readable(Bytes) when Bytes > 1000000 -> 
    {format_float(Bytes / 1000000), "MB"};
human_readable(Bytes) when Bytes > 1000 -> 
    {format_float(Bytes / 1000), "KB"};
human_readable(Bytes) when Bytes ->
    {integer_to_list(Bytes), "B"}.

format_float(Float) -> io_lib:format("~.2f", [Float]).
