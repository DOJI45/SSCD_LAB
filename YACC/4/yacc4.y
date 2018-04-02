%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
extern int yyerror();
%}

%token NUM

%%
S : E
  ;
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '(' E ')'
  | NUM
  ;

%%

int yyerror(){
printf("Invalid input!!");
exit(0);
}

int main(){
printf("Enter expression: ");
yyparse();
printf("Expression is valid!!");
return 0;
}
