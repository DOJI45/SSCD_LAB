%{
#include<stdio.h>
#include<string.h>
char find[100],replace[100];
%}

%%
[a-zA-Z]+ {if(strcmp(find,yytext)==0)fprintf(yyout,replace);
            else fprintf(yyout,yytext);}
. fprintf(yyout,yytext);
%%

int main(){
printf("Find: ");
scanf("%s",find);
printf("Replace: ");
scanf("%s",replace);
yyin = fopen("sample.txt","r");
yyout = fopen("output.txt","w");
yylex();
return 0;

}
