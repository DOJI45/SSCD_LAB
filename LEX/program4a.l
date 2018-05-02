%{
#include<stdio.h>
int comment = 0,i;
%}

%x com

%%
"//"[^\n]* {comment++;fprintf(yyout," ");}
"/*" {BEGIN(com);}
<com>"*/" {BEGIN(INITIAL);comment++;fprintf(yyout," ");}
<com>. {}

%%

int main(){
yyin = fopen("input.c","r");
yyout = fopen("output.c","w");
yylex();
printf("No of comment lines: %d\n",comment);
return 0;
}
