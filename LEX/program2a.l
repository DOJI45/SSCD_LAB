%{
#include<stdio.h>
int line=0,character=0,word=0;
%}

%%
[a-zA-Z]+ {word++;character+=yyleng;}
[ ] {character++;}
\n {line++;}
@  {line++;return 0;}
%%

int main(int argc,char* argv[]){

if(argc<2){
printf("Please give the input for lex!!");
return 0;
}

yyin = fopen(argv[1],"r");
yylex();

printf("\nNo of characters: %d",character);
printf("\nNo of lines: %d",line);
printf("\nNo of words: %d\n",word);
return 0;
}
