%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
extern int yyerror();
int count = 0;
extern FILE* yyin;
%}

%token FOR DIG EQU LEQ GEQ LT GT INC ID DEC

%%

S : ST                {printf("Input accepted!! No of for loops = %d\n",count);}
  ;
ST: FOR '(' EXP ';' EXP ';' EXP ')' DEF  {count++;}
  ;
DEF : '{' BODY '}'
  | EXP ';'
  | ST
  |
  ;
BODY :  BODY BODY
  | EXP ';'
  | ST
  |
  ;
EXP : ID EQU DIG
  | ID LEQ DIG
  | ID LEQ ID
  | ID GEQ DIG
  | ID GEQ ID
  | ID LT DIG
  | ID GT DIG
  | ID LT ID
  | ID GT ID
  | ID INC
  | ID DEC
  ;


%%

int yyerror(){
printf("Invalid input!!");
exit(0);
}

int main(){
yyin = fopen("input.c","r");
yyparse();
return 0;
}
