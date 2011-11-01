-module(blaha).
-export([get_json/0, get_json/1]).

%% Table data is on the format
%% [{<<"table">>, [[row1col1, row1col2, ...], [row2col1, row2col2, ...], ... ]}]
get_json() ->
	Processes = erlang:processes(),
	Fun = fun(PID, Key) ->
		KV = erlang:process_info(PID),
		proplists:get_value(Key, KV) end,
	% PID, LINK, regname, curfunc
	TableData = [
	[PID,
	 Fun(PID,registered_name),
	 Fun(PID, current_function)] || PID <- Processes],
	{ok, jsfw_json:encode(TableData)}.

%% [[row1elem1, row1elem2], []]
get_json(Arg) ->
	% Pid = jsfw_utility:arg_to_pid(Arg),
	% 	Info = erlang:process_info(Pid),
	% 	TableData = [[Key, Value]  || {Key, Value} <- Info],
	% 	jsfw_json:encode(TableData).
	{ok, jsfw_json:encode(Arg)}.
