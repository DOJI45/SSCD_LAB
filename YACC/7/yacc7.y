%{
#include<stdio.h>
#include<stdlib.h>
extern int yyerror();
extern int yylex();
extern FILE* yyin;
int count = 0;
%}

%token INT FLOAT CHAR DOUBLE UDRSCR DIG ALPHA

%%
S : ST      {printf("Input accepted!!\nNo of variable = %d\n",count);}
  ;
ST : KEY MANY ';' ST
  |
  ;

MANY: VAR ',' MANY   {count++;}
  | VAR               {count++;}
  |
  ;
KEY : INT
  | FLOAT
  | CHAR
  | DOUBLE
  ;

VAR : ALPHA EXP
  | UDRSCR EXP
  ;

EXP: EXP EXP
  | DIG
  | ALPHA
  | UDRSCR
  |
  ;

%%

int yyerror(){
printf("Invalid input!!");
exit(0);
}

int main(){
printf("Reading input...\n");
yyin = fopen("input.c","r");
yyparse();
return 0;
}
