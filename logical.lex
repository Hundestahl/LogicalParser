%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
int yyerror(char* s);
%}

%option noyywrap

%%

[0|1]	{yylval = atoi(yytext); return (NUM); }
"or"  { return '|'; }
"xor" { return '^'; }
"and" { return '&'; }
"not" { return '!'; }
"("   { return '('; }
")"   { return ')'; }
[\n] {return yytext[0]; }
[ \t]  { }
.      { yyerror("unexpected symbol"); }

%%

