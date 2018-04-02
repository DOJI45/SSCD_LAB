%{
#include<stdio.h>
#include<stdlib.h>
extern int yyerror();
extern int yylex();
extern FILE* yyin;
int count = 0;
%}

%token IF ID DIG LEQ GEQ EQQU EQU LT GT NOT

%%

S : ST   { printf("Input accepted!!\n No of levels: %d\n",count );}

ST : IF '(' EXP ')' DEF   {count++;}

DEF: '{' BODY '}'
  | EXP ';'
  | ST
  |
  ;

BODY: BODY BODY
  | EXP ';'
  | ST
  |
  ;

EXP : ID LEQ ID
  | ID LEQ DIG
  | ID GEQ ID
  | ID GEQ DIG
  | ID EQQU ID
  | ID EQQU DIG
  | ID EQU ID
  | ID EQU DIG
  | ID LT ID
  | ID LT DIG
  | ID GT ID
  | ID GT DIG
  | ID NOT ID
  | ID NOT DIG
  ;


%%

int yyerror(){
printf("Invalid input!!");
exit(0);
}

int main(){
printf("Reading input......\n");
yyin = fopen("input.c","r");
yyparse();
return 0;
}
