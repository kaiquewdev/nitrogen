% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (action_show).
-include ("wf.inc").
-compile(export_all).

render_action(Record, Context) ->
	Effect = #jquery_effect {
		type=show,
		effect = Record#show.effect,
		options = Record#show.options,
		speed = Record#show.speed
	},
	{ok, Effect, Context}.