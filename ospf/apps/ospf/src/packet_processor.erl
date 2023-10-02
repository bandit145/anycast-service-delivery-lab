-module(packet_processor).
-behavior(gen_statem).
-export([init/1, start_link/1, callback_mode/0]).

-record(pp_state, {socket}).

callback_mode() -> [state_functions].

start_link(_) ->
	gen_statem:start_link(?MODULE, {}, []).

init({}) ->
	{ok, Socket} = socket:open(inet, raw, tcp),
	ok = socket:bind(Socket, any),
	socket:monitor(Socket),
	io:format("Started Packet Processor~n"),
	{ok, listen, #pp_state{socket=Socket}}.

listen(State) ->
	{ok, Msg} = socket:recvmsg(State#pp_state.socket),
	io:format("Got message/data ~p~n", [Msg]),
	{reply, {listen}, State}.