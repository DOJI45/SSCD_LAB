%{
#include<stdio.h>
int id = 0,i,k;
%}

%%
("int"|"char"|"float"|"double")(.)*";" {k = 0;
                                        printf("%s\n",yytext);
                                        while(k<yyleng && yytext[k]!=32)
                                              k++;
                                        for(i=k+1;i<yyleng;i++){
                                        if(yytext[i]==',')
                                          continue;
                                        else if(yytext[i]==';')
                                          break;
                                        else if(yytext[i]=='['){
                                        while(yytext[i]!=']')
                                          i++;
                                        }
                                        else{
                                          while(yytext[i]!=',' || yytext[i]!='[' || yytext[i]!=';'){
                                                printf("%c",yytext[i]);
                                                i++;
                                          }

                                        }
                                        printf("\n");
                                        id++;
                                        }
                                }

. ;

%%

int main(){
yyin = fopen("identifier.c","r");
yylex();
printf("\nNo of identifiers: %d\n",id);
return 0;
}
