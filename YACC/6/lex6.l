%{
#include "y.tab.h"
%}



%%
[\t \n] ;
"if" return IF;
[a-zA-Z_]+ return ID;
[0-9]+ return DIG;
"<=" return LEQ;
">=" return GEQ;
"==" return EQQU;
"=" return EQU;
"<" return LT;
">" return GT;
"!=" return NOT;
. return yytext[0];

%%
