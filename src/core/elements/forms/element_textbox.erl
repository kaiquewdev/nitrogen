% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_textbox).
-include ("wf.inc").
-compile(export_all).

reflect() -> record_info(fields, textbox).

render_element(HtmlID, Record, Context) -> 
	{ok, Context1} = case Record#textbox.next of
		undefined -> {ok, Context};
		Next -> wff:wire(Record#textbox.id, #event { type=enterkey, actions=wf:f("Nitrogen.$go_next('~s');", [Next]) }, Context)
	end,

	{ok, Context2} = case Record#textbox.postback of
		undefined -> {ok, Context1};
		Postback -> wff:wire(Record#textbox.id, #event { type=enterkey, postback=Postback }, Context1)
	end,
	
	Value = wff:html_encode(Record#textbox.text, Record#textbox.html_encode),
	Html = wf_tags:emit_tag(input, [
		{id, HtmlID}, 
		{id, HtmlID},
		{type, text}, 
		{class, [textbox, Record#textbox.class]},
		{style, Record#textbox.style},
		{value, Value}
	]),
	{ok, Html, Context2}.