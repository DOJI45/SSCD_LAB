%{
#include<stdio.h>
#include<string.h>
char find[100],replace[100],tmp[100];
int i,n,j,cnt,m,rp;

%}

%%
[a-zA-Z]+ {    i = 0;
                rp = 0;
                n = strlen(find);
                if(i+n<=yyleng){
                  while(i+n<=yyleng){
                        cnt = 0;
                        j = i;
                        while(j<yyleng && yytext[j]==find[cnt]){
                          j++;cnt++;
                        }
                        if(cnt==n){
                            m = strlen(replace);
                            cnt = 0;
                            while(cnt!=m){
                                tmp[rp++] = replace[cnt++];
                            }
                            i=i+n;
                            continue;
                          }
                          tmp[rp++] = yytext[i];
                          i++;
                        }
                      for(;i<yyleng;i++)
                        tmp[rp++] = yytext[i];
                    fprintf(yyout,"%s",tmp);
                    for(i=0;i<90;i++)
                      tmp[i] = '\0';
                  }
                  else{
                    fprintf(yyout,"%s",yytext);
                  }
                }


. fprintf(yyout,"%s",yytext);
%%

int main(){
printf("Find: ");
scanf("%s",find);
printf("Replace: ");
scanf("%s",replace);
yyin = fopen("sample.txt","r");
yyout = fopen("output.txt","w");
yylex();
return 0;

}
