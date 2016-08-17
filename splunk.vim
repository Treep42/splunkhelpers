" Vim syntax file
" Language:	Splunk> config file (overwrites generic config file syntax
" highlighting)

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif


" splunk config file key=value pairs
syn match splunkValue 	"=\s*.*"	contains=splunkString,splunkNumber,splunkBoolean
syn match splunkKey	"^[a-zA-Z_.]\+" nextgroup=splunkValue skipwhite

" special characters
syn match splunkSpecial	"|"

" String
syn region	splunkString	start=+"+ skip=+\\"+ end=+"+ oneline
syn region	splunkString	start=+'+ skip=+\\'+ end=+'+ oneline

" Numbers
" Regular int like number with - + or nothing in front
syn match splunkNumber '\d\+'  
syn match splunkNumber '[-+]\d\+'  

" Floating point number with decimal no E or e (+,-)
syn match splunkNumber '\d\+\.\d*'  
syn match splunkNumber '[-+]\d\+\.\d*'  

" Floating point like number with E and no decimal point (+,-)
syn match splunkNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'  
syn match splunkNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'  

" Floating point like number with E and decimal point (+,-)
syn match splunkNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'  
syn match splunkNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'  

" splunk earliest and latest time strings are kinda numbers too
" TODO
"syn match splunkTime ''

" splunk 6.4.2 commands
syn keyword splunkCommand	abstract accum addcoltotals addinfo addtotals analyzefields anomalies anomalydetection
syn keyword splunkCommand	anomalousvalue append appendcols appendpipe arules associate autoregress
syn keyword splunkCommand	bin bucketdir chart cluster cofilter collect concurrency contingency convert
syn keyword splunkCommand	correlate crawl datamodel dbinspect dedup delete delta diff erex eval eventcount
syn keyword splunkCommand	eventstats extract fieldformat fields fieldsummary filldown fillnull findtypes
syn keyword splunkCommand	folderize foreach format gauge gentimes geom geomfilter geostats head highlight history iconify
syn keyword splunkCommand	input inputcsv inputlookup iplocation join kmeans kvform loadjob localize localop lookup
syn keyword splunkCommand	makecontinuous makemv makeresults map metadata metasearch multikv multisearch mvcombine
syn keyword splunkCommand	mvexpand nomv outlier outputcsv outputlookup outputtext overlap pivot predict rangemap
syn keyword splunkCommand	rare regex relevancy reltime rename replace rest return reverse rex rtorder savedsearch
syn keyword splunkCommand	script run scrub searchtxn selfjoin sendemail set setfields sichart sirare sistats
syn keyword splunkCommand	sitimechart sitop sort spath stats strcat streamstats table tags tail timechart top 
syn keyword splunkCommand	transaction transpose trendline tscollect tstats typeahead typelearner typre uniq untable where
syn keyword splunkCommand	x11 xmlkw xpath xyseries
"add those that shouldn't override other syntax elements as match groups
syn match splunkCommandNK	"search" 
syn match splunkCommandNK	"audit"

" splunk 6.4.2 functions for eval, where
syn region splunkBraces	start="(" end=")" contains=splunkString,splunkNumber,splunkBoolean,SplunkFunc transparent keepend
syn keyword splunkFunc	case cidrmatch coalesce false if like match null nullify searchmatch true validate nextgroup=splunkBraces skipwhite	
syn keyword splunkFunc	tonumber tostring nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	md5 sha1 sha256 sha512 nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	now relative_time strftime strptime time nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	isbool isint isnotnull isnull isnum isstr typeof nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	abs ceiling exact exp floor ln log pi pow round sigfig sqrt nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	commands mvappend mvcount mvdedup mvfilter mvfind mvindex mvjoin mvrange mvsort mvzip nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	max min random nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	len lower ltrim replace rtrim spath split substr trim upper urldecode nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	acos acosh asin asinh atan atan2 atanh cos hypot sin sinh tan tanh nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	list values count nextgroup=splunkBraces skipwhite
syn keyword splunkFunc	count

" Boolean
syn keyword splunkBoolean 	true false

" splunk config file search = <search-string>
"syn match splunkSavedSearch "^(search)\s*="
"syn region splunkSearch start="search\s*=" skip="\\\n" end="\n" matchgroup=Identifier transparent contains=splunkCommand,splunkFunc,splunkSpecial,splunkString,splunkNumber,splunkBoolean,splunkCommandNK keepend

" splunk config file stanza
syn match splunkStanza	"^\[[a-zA-Z_]*\]$" 

" splunk search macro
syn region splunkMacro start="`" end="`" oneline

" todo keywords
syn keyword	splunkTodo	contained TODO FIXME XXX
" Documentation keywords
"syn keyword splunkDoc	contained @author @revision @appname @brief @end @stanza @history @copyright
syn match splunkDoc	"@author\|@revision\|@appname\|@brief\|@end\|@stanza\|@history\|@copyright" contained
" Full line comment
syn match	splunkComment	"#.*$" contains=splunkTodo,splunkDoc

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link splunkComment	Comment
hi def link splunkTodo	Todo
hi def link splunkDoc	Special
hi def link splunkString	Constant
hi def link splunkNumber	Number
hi def link splunkBoolean	Boolean

hi def link splunkCommand	Statement
hi def link splunkCommandNK	Statement
hi def link splunkFunc	Function
hi def link splunkBraces	Function
hi def link splunkStanza	Type
hi def link splunkKey	Identifier
hi def link splunkSavedSearch	Identifier
hi def link splunkMacro Macro
"hi def link splunkSpecial Special

"hi def link splunkKey	Special
"hi def link splunkValue	Special

let b:current_syntax = "splunk"

" vim: ts=4 sw=4
