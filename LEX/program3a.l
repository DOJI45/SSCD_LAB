%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int pi = 0,ni = 0,pf = 0,nf = 0;
%}

%%

[+]?[1-9][0-9]*[/][+]?[1-9][0-9]* {pf++;}
-[1-9][0-9]*[/]-[1-9][0-9]* {pf++;}
-[1-9][0-9]*[/][+]?[1-9][0-9]* {nf++;}
[+]?[1-9][0-9]*[/]-[1-9][0-9]* {nf++;}
[+]?[0-9]*[.][0-9]+ {pf++;}
-[0-9]*[.][0-9]+ {nf++;}
[+]?[1-9][0-9]* {pi++;}
-[1-9][0-9]* {ni++;}
[ ] ;
. return yyerror();
\n return 0;

%%

int yyerror(){
printf("\nInvalid expression!!!\n");
exit(0);
}

int main(){
printf("Enter an expression: ");
yylex();
printf("\nNo of positive integers: %d",pi);
printf("\nNo of negative integers: %d",ni);
printf("\nNo of positive fractions: %d",pf);
printf("\nNo of negative fractions: %d\n",nf);
return 0;
}
