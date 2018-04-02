%{
#include "y.tab.h"
extern int yylval;
%}

%%
[a-zA-Z0-9_]+ {yylval = atoi(yytext);return NUM;}
. return yytext[0];
\n return 0;

%%
