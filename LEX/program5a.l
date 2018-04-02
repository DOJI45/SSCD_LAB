%{
#include<stdio.h>
int sf=0,pf=0;
%}

%%
"scanf" {sf++;fprintf(yyout,"READ");}
"printf" {pf++;fprintf(yyout,"WRITE");}

%%

int main(){
yyin = fopen("test.c","r");
yyout = fopen("out.c","w");
yylex();
printf("\nNo of scanf: %d",sf);
printf("\nNo of printf: %d\n",pf);
return 0;
}
