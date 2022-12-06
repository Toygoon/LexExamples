%{
    #include <stdlib.h>
    #include "y.tab.h"
    void yyerror(char *);
%}

%option noyywrap

%%

[a-z]       {
                // a-z 중에서 한 개의 문자가 오게 될 경우, 이걸 변수로 사용하겠다는 의미
                yylval = *yytext - 'a';

                return VARIABLE;
}


[0-9]+      {
                // yylval : token을 저장하는 미리 선언된 int 형식 변수임
                yylval = atoi(yytext);
                // parser에서 만든 INTEGER가 y.tab.h에 포함되어 있음
                return INTEGER;
            }

[-+()*/=\n]  {
                // 연산자 같은 경우에는 문자 자체를 token으로 넘겨주겠다는 의미
                return *yytext;
            }

[ \t]       {
                // 공백 문자 무시
            };

.           yyerror("invalid character");

%%

