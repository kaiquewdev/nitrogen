% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_literal).
-compile(export_all).
-include ("wf.inc").

reflect() -> record_info(fields, literal).

render_context(_HtmlID, Record, Context) -> 
	Elements = wf:html_encode(Record#literal.text, Record#literal.html_encode),
	{ok, Elements, Context}.