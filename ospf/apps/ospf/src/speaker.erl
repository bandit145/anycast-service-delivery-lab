-module(speaker).
-bahvior(gen_statem).
-export([init/1, start_link/1, handle_event/4, callback_mode/0]).

-record(speaker_state, {router_id, neighbors}).

start_link({RouterId}) ->
	gen_statem:start_link(?MODULE, {}, []).

init({RouterId}) ->
	{ok, #speaker_state{router_id=RouterId, neighbors=sets:new()}}.

callback_mode() -> [state_enter].


handle_event(hello_loop, OldState, State, Data) ->
	{ok}.