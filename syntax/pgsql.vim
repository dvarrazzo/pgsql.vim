" Vim syntax file
" Language:     pgsql
" Maintainer:   Devrim GUNDUZ <devrim@PostgreSQL.org>
" Contributors: Jacek Wysocki, Ryan Delaney <ryan.delaney@gmail.com>
" Last Change:  $Fri May 23 09:55:21 PDT 2014$
" Filenames:    *.pgsql *.plpgsql
" URL:			http://www.gunduz.org/postgresql/pgsql.vim
" Note:			The definitions below are for PostgreSQL 8.4, some versions may differ.
" Changelog:	Thanks to Todd A. Cook for the updates
" Changelog:	Thanks a lot to David Fetter for the big update set, that came as of Mar 11, 2010.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Always ignore case
syn case ignore

" Section: Syntax {{{1

" Section: Miscellaneous {{{2

syn region pgsqlIdentifier	 matchgroup=Parens start="("  end=")" contains=ALL

" General keywords which don't fall into other categories {{{3
"
" Use match instead of keyword to lower priority and allow data types bits
" and other constructs to match too
syn match pgsqlKeyword	    "\<as\>"
syn match pgsqlKeyword	    "\<add\>"
syn match pgsqlKeyword	    "\<all\>"
syn match pgsqlKeyword	    "\<authorization\>"
syn match pgsqlKeyword	    "\<cast\>"
syn match pgsqlKeyword	    "\<cluster\>"
syn match pgsqlKeyword	    "\<conflict\>"
syn match pgsqlKeyword	    "\<continue\>"
syn match pgsqlKeyword	    "\<copy\>"
syn match pgsqlKeyword	    "\<default\>"
syn match pgsqlKeyword	    "\<do\>"
syn match pgsqlKeyword	    "\<drop\>"
syn match pgsqlKeyword	    "\<end\>"
syn match pgsqlOperator     "\<exists\>"
" fun fact: 'create table fetch ()' fails, but not 'create table move ()'
syn match pgsqlKeyword      "\<fetch\>"
syn match pgsqlKeyword      "\<for\>"
syn match pgsqlKeyword      "\<foreach\>"
syn match pgsqlKeyword      "\<full\>"
syn match pgsqlKeyword	    "\<from\>"
syn match pgsqlKeyword      "\<grant\>"
syn match pgsqlKeyword      "\<if\>"
syn match pgsqlOperator     "\<in\>"
syn match pgsqlKeyword	    "\<key\>"
syn match pgsqlKeyword      "\<language\>"
syn match pgsqlKeyword      "\<nothing\>"
syn match pgsqlKeyword      "\<on\>"
syn match pgsqlKeyword	    "\<only\>"
syn match pgsqlKeyword	    "\<options\>"
syn match pgsqlKeyword	    "\<raise\>"
syn match pgsqlKeyword	    "\<range\>"
syn match pgsqlKeyword	    "\<rename\>"
syn match pgsqlKeyword      "\<return\>"
syn match pgsqlKeyword      "\<returns\>"
syn match pgsqlKeyword	    "\<row\>"
syn match pgsqlKeyword	    "\<rows\>"
syn match pgsqlKeyword	    "\<schema\>"
syn match pgsqlKeyword	    "\<set\>"
syn match pgsqlKeyword	    "\<table\>"
syn match pgsqlKeyword	    "\<to\>"
syn match pgsqlKeyword	    "\<user\>"
syn match pgsqlKeyword	    "\<update\>"
syn match pgsqlKeyword      "\<with\(\_s\+recursive\)\?\>"
syn match pgsqlKeyword	    "\<while\>"
syn match pgsqlKeyword	    "\<where\>"

syn match pgsqlKeyword      "\<\(begin\|commit\|rollback\|abort\|start\|end\)\(\_s\+work\|\_s\+transaction\)\?\>"
syn match pgsqlKeyword      "\<isolation\_s\+level\_s\+\(serializable\|repeatable\_s\+read\|read\_s\+committed\|read\_s\+uncommitted\)\>"
syn match pgsqlKeyword      "\<read\_s\+\(write\|only\)\>"

syn match pgsqlKeyword      "\<\(commit\|rollback\)\_s\+prepared\>"
syn match pgsqlKeyword      "\<savepoint\>"
syn match pgsqlKeyword      "\<rollback\_s\+to\_s\+savepoint\>"
syn match pgsqlKeyword      "\<release\(\_s\+savepoint\)\?\>"

syn match pgsqlKeyword      "\<close\(\_s\+all\)\?\>"
syn match pgsqlKeyword      "\<\(binary\_s\+\|insensitive\_s\+\|\(no\_s\+\)\?scroll\_s\+\)*cursor\(\_s\+with\(out\)\_s\+hold\)\?\_s\+for\>"

syn match pgsqlKeyword      "\<current\_s\+of\>"
syn match pgsqlKeyword      "\<delete\_s\+from\>"
syn match pgsqlKeyword      "\<discard\_s\+\(all\|plans\|sequences\|temp\|temporary\)\>"

syn match pgsqlKeyword      "\<\(alter\|add\|drop\|comment\_s\+on\|create\)\_s\+\(aggregate\|attribute\|cast\|collation\|conversion\|database\|column\|default\_s\+privileges\|domain\|\(event\_s\+\)\?trigger\|extension\|foreign\_s\+\(data\_s\+wrapper\|table\)\|function\|group\|index\(\_s\+concurrently\)\?\|\(procedural\_s\+\)\?language\|materialized\_s\+view\|operator\(\_s\+class\|\_s\+family\)\?\|owned\_s\+by\|role\|rule\|schema\|sequence\|server\|table\|tablespace\|text\_s\+search\_s\+\(configuration\|dictionary\|parser\|template\)\|type\|user\(\_s\+mapping\)\?\|view\)\>"

syn match pgsqlKeyword      "\<create\_s\+default\_s\+conversion\>"
syn match pgsqlKeyword      "\<create\_s\+\(or\_s\+replace\_s\+\)\?\(function\|\(trusted\_s\+\)\?\(procedural\_s\+\)\?language\|rule\)\>"
syn match pgsqlKeyword      "\<create\_s\+unique\_s\+index\(\_s\+concurrently\)\?\>"
syn match pgsqlKeyword      "\<create\_s\+temp\(orary\)\?\_s\+sequence\>"
syn match pgsqlKeyword      "\<create\_s\+\(temp\(orary\)\?\|unlogged\)\_s\+table\>"
syn match pgsqlKeyword      "\<on\_s\+commit\_s\+\(preserve\_s\+rows\|delete\_s\+rows\|drop\)\>"
syn match pgsqlKeyword      "\<match\_s\+\(full\|partial\|simple\)\>"
syn match pgsqlKeyword      "\<\(including\|excluding\)\_s\+\(defaults\|constraints\|indexes\|storage\|comments\|all\)\>"

syn match pgsqlKeyword      "\<create\_s\+\(constraint\)\?\_s\+\(trigger\)\>"
syn match pgsqlKeyword      "\<\(before\|after\|instead\_s\+of\)\_s\+\(insert\|update\|delete\|truncate\)\(\_s\+or\_s\+\(insert\|update\|delete\|truncate\)\)*\>"
syn match pgsqlKeyword      "\<for\_s\+\(each\_s\+\)\?\(row\|statement\)\>"

syn match pgsqlKeyword      "\<create\_s\+\(or\_s\+replace\_s\+\)\?\(temp\(orary\)\?\_s\+\)\?\(recursive\_s\+\)\?view\>"
syn match pgsqlKeyword      "\<with\_s\+\(cascaded\|local\)\_s\+check\_s\+option\>"

syn match pgsqlKeyword      "\<do\(\_s\+also\|\_s\+instead\)\?\(\_s\+nothing\)\?\>"

syn match pgsqlKeyword      "\<\(rename\|owner\)\_s\+to\>"
syn match pgsqlKeyword      "\<for\_s\+\(role\|user\)\>"
syn match pgsqlKeyword      "\<\(drop\|rename\|validate\)\_s\+constraint\>"
syn match pgsqlKeyword      "\<\(disable\|enable\(\_s\+\(replica\|always\)\)\?\)\(\_s\+trigger\)\?\>"
syn match pgsqlKeyword      "\<\(no\_s\+\)\?\(handler\|validator\)\>"
syn match pgsqlKeyword      "\<if\_s\+\(not\_s\+\)\?exists\>"
syn match pgsqlKeyword      "\<\(set\|drop\)\_s\+\(default\|not\_s\+null\)\>"
syn match pgsqlKeyword      "\<\(set\_s\+data\_s\+\)\?type\>"
syn match pgsqlKeyword      "\<set\_s\+storage\_s\+\(plain\|external\|extended\|main\)\>"
syn match pgsqlKeyword      "\<set\_s\+statistics\>"
syn match pgsqlKeyword      "\<cluster\_s\+on\>"
syn match pgsqlKeyword      "\<set\_s\+without\_s\+cluster\>"
syn match pgsqlKeyword      "\<\(enable\|disable\)\_s\+rule\>"
syn match pgsqlKeyword      "\<as\_s\+on\_s\+\(select\|insert\|update\|delete\)\>"

syn match pgsqlKeyword      "\<alter\_s\+\(constraint\|system\)\>"
syn match pgsqlKeyword      "\<\(initially\_s\+\)\?\(deferred\|immediate\)\>"
syn match pgsqlKeyword      "\<on\_s\+\(delete\|update\)>"
syn match pgsqlKeyword      "\<set\_s\+with\(out\)\?\_s\+oids\>"
syn match pgsqlKeyword      "\<for\_s\+\(search\|order\_s\+by\)\>"
syn match pgsqlKeyword      "\<\(no\_s\+\)\?inherit\>"
syn match pgsqlKeyword      "\<\(not\_s\+\)\?of\>"
syn match pgsqlKeyword      "\<primary\_s\+key\>"
syn match pgsqlKeyword      "\<foreign\_s\+key\>"
syn match pgsqlKeyword      "\<replica\_s\+identity\>"
syn match pgsqlKeyword      "\<using\(\_s\+index\(\_s\+tablespace\)\?\)\?\>"
syn match pgsqlKeyword      "\<with\(out\)\?\_s\+function\>"
syn match pgsqlKeyword      "\<with\_s\+inout\>"
syn match pgsqlKeyword      "\<as\_s\+\(assignment\|implicit\)\>"

syn match pgsqlKeyword      "\<explain\(\_s\+verbose\|\_s\+analyze\)*\>"
syn match pgsqlKeyword      "\<\(analyze\|verbose\|costs\|buffers\|timing\)\(\_s\+\(true\|on\|1\|false\|off\|0\)\)\?\>"
syn match pgsqlKeyword      "\<format\_s\+\(text\|xml\|json\|yaml\)\>"

syn match pgsqlKeyword      "\<\(fetch\|move\)\_s\+\(next\|prior\|first\|last\|absolute\|relative\|\(forward\|backward\)\(\_s\+all\)\?\)\>"

syn match pgsqlKeyword      "\<grant\_s\+\(select\|insert\|update\|delete\|truncate\|references\|trigger\|connect\|temporary\|temp\|usage\|execute\|all\(\_s\+privileges\)\?\)\(\_s*,\_s*\(select\|insert\|update\|delete\|truncate\|references\|trigger\|connect\|temporary\|temp\|usage\|execute\|all\(\_s\+privileges\)\?\)\)*\>"
syn match pgsqlKeyword      "\<on\_s\+\(table\|sequence\|database\|domain\|foreign\_s\+data\_s\+wrapper\|foreign\_s\+server\|function\|language\|large\_s\+object\|schema\|tablespace\|type\|all\_s\+\(tables\|sequences\|functions\)\_s\+in\_s\+schema\)\>"
syn match pgsqlKeyword      "\<with\_s\+\(grant\|admin\)\_s\+option\>"
syn match pgsqlKeyword      "\<insert\_s\+into\>"
syn match pgsqlKeyword      "\<\(default\_s\+\)\?values\>"

syn match pgsqlKeyword      "\<\(called\|returns\_s\+null\)\_s\+on\_s\+null\_s\+input\>"
syn match pgsqlKeyword      "\<\(external\_s\+\)\?security\_s\+\(definer\|invoker\)\>"
syn match pgsqlKeyword      "\<from\_s\+current\>"

syn match pgsqlKeyword      "\<in\_s\+schema\>"
syn match pgsqlKeyword      "\<in\_s\+\(access\_s\+share\|row\_s\+share\|row\_s\+exclusive\|\_s\+share\_s\+update\_s\+exclusive\|share\|share\_s\+row\_s\+exclusive\|exclusive\|access\_s\+exclusive\)\_s\+mode\>"

syn match pgsqlKeyword      "\<prepare\(\_s\+transaction\)\?\>"
syn match pgsqlKeyword      "\<execute\(\_s\+procedure\)\?\>"
syn match pgsqlKeyword      "\<deallocate\(\_s\+prepare\)\?\>"
syn match pgsqlKeyword      "\<\(reassign\_s\+\)\?owned\_s\+by\>"

syn match pgsqlKeyword      "\<refresh\_s\+materialized\_s\+view\(\_s\+concurrently\)\?\>"
syn match pgsqlKeyword      "\<with\_s\+\(no\_s\+\)\?data\>"

syn match pgsqlKeyword      "\<reindex\_s\+\(index\|table\|database\|system\)\>"

syn match pgsqlKeyword      "\<reset\(\_s\+all\)\?\>"

syn match pgsqlKeyword      "\<revoke\(\_s\+grant\_s\+option\_s\+for\)\?\>"
syn match pgsqlKeyword      "\<revoke\(\_s\+grant\_s\+option\_s\+for\)\?\_s\+\(select\|insert\|update\|delete\|truncate\|references\|trigger\|connect\|temporary\|temp\|usage\|execute\|all\(\_s\+privileges\)\?\)\(\_s*,\_s*\(select\|insert\|update\|delete\|truncate\|references\|trigger\|connect\|temporary\|temp\|usage\|execute\|all\(\_s\+privileges\)\?\)\)*\>"
syn match pgsqlKeyword      "\<security\_s\+label\>"

syn match pgsqlKeyword      "\<select\(\_s\+all\|\_s\+distinct\(\_s\+on\)\?\)\?\>"
syn match pgsqlKeyword      "\<for\_s\+\(update\|no\_s\+key\_s\+update\|share\|key\_s\+share\)\_s\+of\>"
syn match pgsqlKeyword      "\<with\_s\+ordinality\>"
syn match pgsqlKeyword      "\<\(\(inner\|cross\|\(left\|right\|full\)\(\_s\+outer\)\?\)\_s\+\)\?join\>"
syn match pgsqlKeyword      "\<union\(\_s\+all\)\?\>"
syn match pgsqlKeyword      "\<\(unbounded\_s\+\)\?\(preceding\|following\)\>"
syn match pgsqlKeyword      "\<group\_s\+by\>"
syn match pgsqlKeyword      "\<order\_s\+by\>"
syn match pgsqlKeyword      "\<current\_s\+row\>"
syn match pgsqlKeyword      "\<partition\_s\+by\>"
syn match pgsqlKeyword      "\<nulls\_s\+\(first\|last\)\>"
syn match pgsqlKeyword      "\<into\(\_s\+\(temp\|temporary\|unlogged\)\)\?\(\_s\+table\)\?\>"
syn match pgsqlKeyword      "\<set\_s\+\(session\|local\|tablespace\|schema\)\?\>"
syn match pgsqlKeyword      "\<set\_s\+constraints\(\_s\+all\)\?\>"
syn match pgsqlKeyword      "\<set\(\_s\+session\|\_s\+local\)\?\_s\+\(role\(\_s\+none\)\?\)\>"
syn match pgsqlKeyword      "\<set\(\_s\+session\|\_s\+local\)\?\_s\+\(session\_s\+authorization\(\_s\+default\)\?\)\>"
syn match pgsqlKeyword      "\<reset\_s\+\(role\|session\_s\+authorization\)\>"
syn match pgsqlKeyword      "\<set\_s\+transaction\(\_s\+snapshot\)\?\>"
syn match pgsqlKeyword      "\<set\_s\+session\_s\+characteristics\_s\+as\_s\+transaction\>"

syn match pgsqlKeyword      "\<show\(\_s\+all\)\?\>"

syn match pgsqlKeyword      "\<\(restart\|continue\)\_s\+identity\>"

syn match pgsqlKeyword      "\<vacuum\(\_s\+full\|\_s\+freeze\|\_s\+verbose\)*\>"

" PL/pgSQL constructs
syn match pgsqlKeyword      "\<raise\_s\+\(debug\|log\|info\|notice\|warning\|exception\)\>"
syn match pgsqlKeyword      "\<return\_s\+query\>"

syn keyword pgsqlKeyword	 and alias asc
syn keyword pgsqlKeyword	 cascade
syn keyword pgsqlKeyword	 checkpoint check cost
syn keyword pgsqlKeyword	 check columns constraint
syn keyword pgsqlKeyword	 databases
syn keyword pgsqlKeyword	 declare deallocate desc
syn keyword pgsqlKeyword	 deferrable diagnostics
syn match   pgsqlKeyword     "\<distinct\>"
syn keyword pgsqlKeyword	 explain elsif exclusion found exception except exclude exit
syn keyword pgsqlKeyword	 force
syn keyword pgsqlKeyword	 global get
syn keyword pgsqlKeyword	 having
syn keyword pgsqlKeyword	 immutable inherits inline intersect
syn keyword pgsqlKeyword	 leakproof lock local limit load loop listen lateral
syn keyword pgsqlKeyword	 natural next notice notify nowait
syn keyword pgsqlKeyword	 out open offset
syn keyword pgsqlKeyword	 password privilege
syn keyword pgsqlKeyword	 perform
syn keyword pgsqlKeyword	 query
syn keyword pgsqlKeyword	 raise reassing references replace restrict
syn keyword pgsqlKeyword	 return returning 
syn keyword pgsqlKeyword	 strict sequences stable setof
syn keyword pgsqlKeyword	 truncate tranaction trigger trusted
syn keyword pgsqlKeyword	 unique unlisten
syn keyword pgsqlKeyword	 version volatile
syn keyword pgsqlKeyword	 window

" Section: Constants {{{2
" Constant values
syn keyword pgsqlConstant	 false true
" weakened to allow matching 'not null'
syn match   pgsqlConstant	 "\<null\>"
" }}}

" Section: Strings {{{2
" Strings (single- and double-quote)
syn region pgsqlIdentifier	 matchgroup=Quote start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region pgsqlIdentifier	 matchgroup=Quote start=+U&"+  skip=+\\\\\|\\"+  end=+"+

syn region pgsqlString		 matchgroup=Quote start=+'+  skip=+\\\\\|\\'+  end=+'+
syn region pgsqlString		 matchgroup=Quote start=+U&'+  skip=+\\\\\|\\'+  end=+'+
syn region pgsqlString		 matchgroup=Quote start=+\$\z([^\$]*\)\$+  end=+\$\z1\$+
syn region pgsqlIdentifier	 matchgroup=Quote start=+\$\z(function\|sql\)\$+  end=+\$\z1\$+ contains=ALL
" }}}

" Section: Numbers {{{2
" Numbers and hexidecimal values
syn match pgsqlNumber		 "-\=\<[0-9]*\>"
syn match pgsqlNumber		 "-\=\<[0-9]*\.[0-9]*\>"
syn match pgsqlNumber		 "-\=\<[0-9]*e[+-]\=[0-9]*\>"
syn match pgsqlNumber		 "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match pgsqlNumber		 "\<0x[abcdefABCDEF0-9]*\>"
" }}}

" Section: Comments {{{2
" Comments (c-style, sql-style)
syn region  pgsqlComment    start="/\*"  end="\*/" contains=pgsqlTodo,pgsqlComment
syn match   pgsqlComment    "--.*" contains=pgsqlTodo
syn sync    ccomment        pgsqlComment
syn keyword pgsqlTodo       todo xxx warn warning contained
syn match   pgsqlTodo       "\<note:"
" }}}

" Section: Variables {{{2
"
" Special variables

syn keyword pgsqlVariable   old new
" Variables available in trigger definitions
syn keyword pgsqlVariable   tg_name tg_when tg_level tg_op tg_relid tg_relname
syn keyword pgsqlVariable   tg_table_name tg_table_schema tg_nargs tg_argv

" SQL-style variables
syn match pgsqlVariable		 "\$[0-9]\+"
syn match pgsqlLabel		 "<<[^>]\+>>"

" psql variables
" negative lookbehinds would tend to be slow,
" but this is only checking for one character, so I'm optimistic
syn match pgsqlVariable		 ":\@<!:[a-zA-Z0-9]\+"
syn match pgsqlVariable		 ":\@<!:'[a-zA-Z0-9]\+'"
syn match pgsqlVariable		 ":\@<!:\"[a-zA-Z0-9]\+\""

" Is this a class of things or just a sort of an alien?
syn match pgsqlExtschema		 "@extschema@"

" Section: Column types {{{3
syn keyword pgsqlType        anyarray anyelement abstime anyenum
syn keyword pgsqlType        anynonarray aclitem
" Would like to have this as type, but even if it's a match it fails
" matching of the any() operator, which is more used.
" syn match   pgsqlType        "\<any\>"
syn keyword pgsqlType        bytea bigserial bool boolean bigint box
syn keyword pgsqlType        cidr cstring cid circle
syn keyword pgsqlType        date
syn keyword pgsqlType        enum
syn keyword pgsqlType        gtsvector
syn keyword pgsqlType        hstore
syn keyword pgsqlType        inet
syn keyword pgsqlType        internal int2vector int int2 int4 int8 integer
syn keyword pgsqlType        json jsonb
syn keyword pgsqlType        line lseg language_handler
syn keyword pgsqlType        macaddr money
syn keyword pgsqlType        opaque oidvector oid
syn keyword pgsqlType        polygon point path period
syn keyword pgsqlType        regclass real regtype refcursor regoperator
syn keyword pgsqlType        reltime record regproc regdictionary regoper
syn keyword pgsqlType        regprocedure regconfig
syn keyword pgsqlType        smgr smallint serial smallserial
syn keyword pgsqlType        serial2 serial4 serial8
syn keyword pgsqlType        tsquery tinterval
syn keyword pgsqlType        trigger tid text
syn keyword pgsqlType        tsvector txid_snapshot
syn keyword pgsqlType        unknown uuid
syn keyword pgsqlType        void
syn keyword pgsqlType        xml xid
" %rowtype, %type PL/pgSQL constructs
syn match pgsqlType          "%\(row\)\?type\>"
" this should actually be the end of a region
syn match pgsqlType          "\<with\(out\)\?\_s\+time\_s\+zone\>"

" Section: Variable types {{{3
syn match  pgsqlType		 "\<float\>"
syn region pgsqlType		 start="\<float\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<double\_s\+precision\>"
syn region pgsqlType		 start="\<double\_s\+precision\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<numeric\>"
syn region pgsqlType		 start="\<numeric\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<decimal\>"
syn region pgsqlType		 start="\<decimal\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<time\(stamp\(tz\)\?\)\?\>"
syn region pgsqlType		 start="\<time\(stamp\(tz\)\?\)\?\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<interval\>"
syn match  pgsqlType		 "\<interval\_s\+\(year\|month\|day\|hour\|minute\|second\)\>"
syn match  pgsqlType		 "\<interval\_s\+year\_s\+to\_s\+month\>"
syn match  pgsqlType		 "\<interval\_s\+day\_s\+to\_s\+\(hour\|minute\|second\)\>"
syn match  pgsqlType		 "\<interval\_s\+hour\_s\+to\_s\+\(minute\|second\)\>"
syn match  pgsqlType		 "\<interval\_s\+minute\_s\+to\_s\+second\>"
syn region pgsqlType		 start="\<interval\_s\+\(\(day\|hour\|minute\)\_s\+to\_s\+\)\?second\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<char\>"
syn region pgsqlType		 start="\<char\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<character\>"
syn region pgsqlType		 start="\<character\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<varchar\>"
syn region pgsqlType		 start="\<varchar\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<character\_s\+varying\>"
syn region pgsqlType		 start="\<character\_s\+varying\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<bit\>"
syn region pgsqlType		 start="\<bit\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<varbit\>"
syn region pgsqlType		 start="\<varbit\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
syn match  pgsqlType		 "\<bit\_s\+varying\>"
syn region pgsqlType		 start="\<bit\_s\+varying\_s*(" end=")" contains=pgsqlNumber,pgsqlVariable
" }}}

" Section: Operators {{{1
" Logical, string and  numeric operators
" note: the 'in' operator is defined above, before lockmodes
syn keyword pgsqlOperator	 array between symmetric and is like regexp rlike ilike any
syn match   pgsqlOperator	 "\<not\>"
syn match   pgsqlOperator	 "\<or\>"
syn region pgsqlOperator	 start="isnull\_s*(" end=")" contains=ALL
syn region pgsqlOperator	 start="interval\_s*(" end=")" contains=ALL
syn region pgsqlOperator	 matchgroup=Quote start="\[" end="\]" contains=ALL
syn match pgsqlOperator	     "\<distinct\_s\+from\>"
syn match pgsqlOperator	     ":="
syn match pgsqlOperator	     "="
syn match pgsqlOperator	     "<>"
syn match pgsqlOperator	     "!="
syn match pgsqlOperator	     ">=\?"
syn match pgsqlOperator	     "<=\?"

" Let's consider this an operator, not operator + constant
syn match   pgsqlKeyword	 "\<not\_s\+null\>"
" }}}

" Section: psql special stuff {{{1
syn region pgsqlCopy    start="\<copy\([^;]\|\n\)\+from\_s\+stdin\([^;]\|\n\)*;" end="\\\."
" TODO: the content would be nice "Normal", not "Special"
syn region pgsqlBackslash	 start="^\\" end="$"
" }}}

" Section: Functions {{{1
" Control flow functions {{{2
syn keyword pgsqlFlow		 case when then else end
syn region pgsqlFlow		 start="ifnull("   end=")"  contains=ALL
syn region pgsqlFlow		 start="nullif("   end=")"  contains=ALL
" }}}

" Section: Definition {{{1
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet

hi def link Parens				Delimiter
hi def link Quote				Delimiter
hi def link pgsqlKeyword		Statement
hi def link pgsqlConstant		Constant
hi def link pgsqlString	  	 	String
hi def link pgsqlNumber			Number
hi def link pgsqlVariable		Identifier
hi def link pgsqlComment		Comment
hi def link pgsqlType			Type
hi def link pgsqlOperator		Operator
hi def link pgsqlFlow			Statement
hi def link pgsqlFunction		Function
hi def link pgsqlLabel			Label
hi def link pgsqlExtschema		Special
hi def link pgsqlTodo			Todo
hi def link pgsqlIdentifier		Normal
hi def link pgsqlCopy			Normal
hi def link pgsqlBackslash		Special
" }}}

let b:current_syntax = 'pgsql'

" Section: Modelines {{{1
" vim600: set foldmethod=marker foldlevel=0 :
