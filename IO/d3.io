OperatorTable addAssignOperator(":","put")
Map put := method(
 self atPut(call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),call evalArgAt(1))
)
curlyBrackets := method(
 map := Map clone
 call message arguments foreach(arg,
  map doMessage(arg)
 )
 map
)
Xml := Object clone do(
 forward := method(
  depth := if(call message hasLocalSlot("depth"),call message depth,0);
  space := "\t" repeated(depth);
  args := call message arguments
  params := nil
  if(args at(0) asString findSeq("curlyBrackets") == 0,params = doString(args removeFirst asString))
  attr := ""
  if(params,params foreach(k,v,attr = " " .. k .. "=\"" .. v .. "\""))
  writeln(space,"<",call message name,attr,">")
  args foreach(
   arg,
   next := arg
   while(next,next depth := depth + 1;next = next next)
   content := doMessage(arg);
   if (content type == "Sequence",writeln(space,"\t",content)))
  writeln(space,"</",call message name,">")
 )
)

Xml html(
 head()
 body(
  div({"params":"type"},"hello,world!")
  div("fuck")
 )
)
