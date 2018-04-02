# SSCD_LAB
SSCD lab programmes

To run lex programmes
- lex filename.l
- cc lex.yy.c -ll
- ./a.out

To run yacc programmes
- lex filename.l
- yacc -d filename.y
- cc lex.yy.c y.tab.c -ll
- ./a.out
