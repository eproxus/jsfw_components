-module(users).
-export([get_json/0, get_json/1]).

-record(user, {
	id,
	name,
	job,
	age
}).

add_user(ID, Name, Job, Age, Acc) ->
	[{ID, #user{name=Name,job=Job,age=Age}}|Acc].

users() ->

	% Names = ["JOHNNY", "bill", "john", "eric", "kenneth", "mike"],
	% IDs = lists:seq(1, length(Names)),
	% Jobs = ["Carpenter", "Painter", "Bus driver", "Pilot", "Police", "Fire fighter"],
	% Ages = lists:seq(20,20+length(Names), 3),
	D1 = add_user(1, "Johnny", "Carpenter", 21, []),
	D2 = add_user(2, "Mike", "Police", 23, D1),
	D3 = add_user(3, "Nick", "Student", 25, D2),
	D3.


%% Table data is on the format
%% [[row1col1, row1col2, ...], [row2col1, row2col2, ...], ... ]
get_json() ->
	% Processes = erlang:processes(),
	% Fun = fun(PID, Key) ->
	% 	KV = erlang:process_info(PID),
	% 	proplists:get_value(Key, KV) end,
	% % PID, LINK, regname, curfunc
	% TableData = [
	% [PID,
	%  Fun(PID,registered_name),
	%  Fun(PID, current_function)] || PID <- Processes],
	% Table = [{<<"table">>, TableData}],
	% application:start(sasl),
	% application:start(os_mon),
	% P = list_to_binary(integer_to_list(cpu_sup:avg1())),
	% jsfw_json:encode(P).
	Users = users(),
	% Ints = [ list_to_binary(integer_to_list(I)) || I <- lists:seq(1,length(Users)) ],

	Table = [ [list_to_binary(integer_to_list(ID)), list_to_binary(Rec#user.name)] || {ID, Rec} <- Users ],
	% Table = lists:zipwith(fun(X,Y) -> [X,Y] end, Ints, Users),
	{ok, jsfw_json:encode(Table)}.

%% Here we are given a user id as argument
get_json(Arg) ->
	io:format("Arg: ~p~n", [Arg]),
	{ok, jsfw_json:encode(<<"Haj">>)}.

%% [[row1elem1, row1elem2], []]
% get_json(Arg) ->
% 	Pid = jsfw_utility:arg_to_pid(Arg),
% 	Info = erlang:process_info(Pid),
% 	TableData = [[Key, Value]  || {Key, Value} <- Info],
% 	Table = [{<<"table">>, TableData}],
% 	jsfw_json:encode(Table).
