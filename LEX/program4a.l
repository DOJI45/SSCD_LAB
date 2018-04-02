%{
#include<stdio.h>
int comment = 0,i;
%}

%%
"//"[^\n]* {comment++;fprintf(yyout,"\n");}
"/*"(.|\n)*"*/" { for(i=0;i<yyleng;i++){
                      if(yytext[i]=='\n')
                      comment++;
                      }
                  comment++;
                  fprintf(yyout,"\n");}


%%

int main(){
yyin = fopen("input.c","r");
yyout = fopen("output.c","w");
yylex();
printf("No of comment lines: %d\n",comment);
return 0;
}
