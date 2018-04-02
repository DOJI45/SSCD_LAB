%{
#include<stdio.h>
#include<stdlib.h>
extern int yyerror();
extern int yylex();
%}

%token A B

%%
Z: S
  ;

S: A S B
  |
  ;

%%

int yyerror(){
printf("Invalid input!!!\n");
exit(0);
}

int main(){
printf("Enter string: ");
yyparse();
printf("Input accepted!!\n");
return 0;
}
