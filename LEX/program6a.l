%{
#include<stdio.h>
int id = 0,v=0;
%}

%%
("int"|"char"|"float"|"double")[ ] {v=1;}
[a-zA-Z_][a-zA-Z0-9]*("["[0-9]*"]")?"="?[0-9]*[ ]*"," {if(v==1)id++;}
[a-zA-Z_][a-zA-Z0-9]*("["[0-9]*"]")?"="?[0-9]*[ ]*";" {if(v==1)id++;v=0;}

. ;

%%

int main(){
yyin = fopen("identifier.c","r");
yylex();
printf("\nNo of identifiers: %d\n",id);

return 0;
}
