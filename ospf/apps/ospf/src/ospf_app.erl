%%%-------------------------------------------------------------------
%% @doc ospf public API
%% @end
%%%-------------------------------------------------------------------

-module(ospf_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    ospf_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
