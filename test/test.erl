-module(test).
-export([get_json/0]).

get_json() ->
	{ok, jsfw_json:encode(<<"hello world from test!">>)}.