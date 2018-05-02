%{
#include<stdio.h>
int c=0,v=0,other=0;
%}

%%

[aeiouAEIOU] {v++;}
[a-zA-Z] {c++;}
. {other++;}
\n return 0;

%%

int main(){
printf("Enter the string : ");
yylex();
printf("No of vowels: %d\nNo of consonants: %d\n",v,c);
printf("Other characters: %d\n",other);
return 0;
}
