%{
#include<stdio.h>
#include<stdlib.h>

extern int yyerror();
extern int yylex();
%}

%token NUM

%left '+' '-'
%left '*' '/'


%%
S : EXP  {printf("Answer: %d\n",$$);}
  ;
EXP : EXP '*' EXP   {$$ = $1*$3;}
  | EXP '-' EXP   {$$ = $1-$3;}
  | EXP '/' EXP   {if($3)$$ = $1/$3; else return yyerror();}
  | EXP '+' EXP   {$$ = $1+$3;}
  | '(' EXP ')'   {$$ = $2;}
  | NUM           {$$ = $1;}
  ;

%%

int yyerror(){
printf("Invalid input!!!");
exit(0);
}

int main(){
printf("Enter the expression: ");
yyparse();
return 0;
}
