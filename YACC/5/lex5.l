%{
#include "y.tab.h"
%}



%%
[\t \n]  ;
"for" return FOR;
[0-9]+ return DIG;
"=" return EQU;
"<=" return LEQ;
">=" return GEQ;
"<" return LT;
">" return GT;
"++" return INC;
"--" return DEC;
[a-zA-Z_]+ return ID;
. return yytext[0];

%%
