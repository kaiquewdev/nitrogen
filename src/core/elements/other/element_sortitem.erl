% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_sortitem).
-include ("wf.inc").
-compile(export_all).

reflect() -> record_info(fields, sortitem).

render_element(HtmlID, Record, Context) -> 
	PickledTag = wff:pickle(Record#sortitem.tag),
	Script = #script { 
		script=wf:f("Nitrogen.$sortitem(obj('me'), '~s');", [PickledTag])
	},
	{ok, Context1} = wff:wire(Record#sortitem.id, Script, Context),
	
	Panel = #panel {
		class="sortitem " ++ wf:to_list(Record#sortitem.class),
		style=Record#sortitem.style,
		body=Record#sortitem.body
	},

	element_panel:render_element(HtmlID, Panel, Context1).
	