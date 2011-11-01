-module(comp_table).
-export([get_json/0]).

%% Table data is on the format
%% [{<<"table">>, [[row1col1, row1col2, ...], [row2col1, row2col2, ...], ... ]}]
get_json() ->
	TableData = [[<<"nicklas">>, X] || X <- lists:seq(1,20)],
	{ok, jsfw_json:encode(TableData)}.

