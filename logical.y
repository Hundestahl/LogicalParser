/*Калькулятор логических выражений над константами «0» и
«1». Знаки действий: «and», «or», «xor», «not».*/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex(void);
int yyerror(char* s);
int yy_scan_string(char* s);
%}

%token NUM
%left '|''^'
%left '&'
%left '!'

%%

S: E '\n'   { printf( "result = %d \n", (int)$$ ); }
  ;

E: E'&'E     { $$ = $1 & $3; } 
|  E'|'E     { $$ = $1 | $3; } 
|  '!'E      { $$ = !$2; }
|  E'^'E     { $$ = $1 ^ $3; }  
|  NUM       { $$ = $1; }
|  '(' E ')' { $$ = $2; }
;

%%

int yyerror(char* mes) {
   printf("%s\n", mes);
   exit(1);
}

int main(int argc, char* argv[]) {
   char *newstr = malloc(strlen(argv[1]) + 2);
   strcpy(newstr, argv[1]);
   strcat(newstr, "\n");

   yy_scan_string(newstr);
   yyparse();
   return 0;
}







//|  E'^'E   { $$ = ($1 & (!$3) ) | ( (!$1) & $3); } // втор_вар
