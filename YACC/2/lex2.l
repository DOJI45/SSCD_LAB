%{
#include "y.tab.h"
%}

%%
"a" { return A;}
"b" {return B;}
"c" {return C;}
. return yytext[0];
\n return 0;

%%
