%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *s);

%}

%token NUMBER EVALUAR

%left '+' '-'
%left '*' '/'
%start INICIO

%%

    //evaluar(12+56);
    INICIO : EVALUAR '(' Expr ')' ';' { 
        printf("\n evaluation response:  %d \n", $3);
        return 0;
    }
    ; 
    // 0        1     2   3    4   5
    // Bison notation is using '$$'
    // $$      $1    $2  $3    $4  $5
    Expr : Expr '+' Expr    { $$ = $1 + $3; }
         | Expr '-' Expr    { $$ = $1 - $3; }
         | Expr '*' Expr    { $$ = $1 * $3; }
         | Expr '/' Expr    { $$ = $1 / $3; }
         | NUMBER           { $$ = $1; }
    ;    

%%

int main() {
    yyparse();
    return 1;
}

void yyerror(char *s) {
    printf("Error: %s\n", s);
}

int yywrap() {
    return 1;
}
