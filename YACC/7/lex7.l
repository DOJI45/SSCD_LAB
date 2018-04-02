%{
#include "y.tab.h"
%}



%%
[\t \n] ;
"int" return INT;
"float" return FLOAT;
"char" return CHAR;
"double" return DOUBLE;
"_" return UDRSCR;
[0-9] return DIG;
[a-zA-Z] return ALPHA;
. return yytext[0];

%%
