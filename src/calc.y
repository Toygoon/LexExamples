%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);

    // symbol table을 만들어 줌
    // 변수 26개는 이미 만들어져 있고, 이걸 사용할 뿐임 (추가로 선언하지 않음)
    int sym[26];
    // %left : 좌결합규칙을 적용

    // yacc에서는 INTEGER 처럼 token이 선언 될 수 있음
%}

%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%%

program:
    program statement '\n'

                        |

                        ;

statement:
    expr                {
                        // expr이 오면 출력
                        printf("%d\n", $1); }

    |VARIABLE '=' expr  {
                        // 변수가 symbol table에 저장되고 있음
                        // '='가 오면 symbol table의 VARIABLE에 expr을 저장
                        sym[$1] = $3;
                        }


expr:
    INTEGER            {
                        // expr : 위에서 선언된 변수
                        // $1 : INTEGER
                        // $$ : INTEGER가 expr로 reduce 가능하면, 이를 이용하겠다는 것을 의미
                        // INTEGER가 이어지면 그것을 변수로 함
                        $$ = $1; }

    | VARIABLE         {
                        // VARIABLE인 경우 symbol table을 참조
                        $$ = sym[$1];
                        }

    | expr '+' expr    {
                        // +가 오면 덧셈
                        $$ = $1 + $3; }

    | expr '-' expr    {
                        // -가 오면 뺄셈
                        $$ = $1 - $3; }

    | expr '*' expr    {
                        // *가 오면 곱셈
                        $$ = $1 * $3; }

    | expr '/' expr    {
                        // /가 오면 나눗셈
                        $$ = $1 / $3; }
    
    | '(' expr ')'     {
                        // 괄호가 오면 그냥 expr
                        $$ = $2; }
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();

    return 0;
}