%{
    #include <stdio.h>
    #include "calculator.tab.h"
    void yyerror(char *);
%}

%option noyywrap
DIGIT [0-9]
NUM {DIGIT}+

%%
{NUM}           { yylval = atoi(yytext); return NUMBER; }
[-()+*/;]       { return *yytext; }
"evaluar"       { return EVALUAR; }
[[:blank:]] ;
.               yyerror("Invalid Character - It is not part of the programming languaje");

%%
