DIGIT	[0-9]
LETTER 	[a-zA-Z]
%{
	int count = 0, numCount = 0;
%}
%option noyywrap

%%

({LETTER}|_)({LETTER}|{DIGIT}|_)*	{printf("ID:%s ", yytext); count++;}
{DIGIT}+	{printf("NUM: %s ", yytext); numCount++;}
.	;
\n	;

%%

int main() {
	yylex();
	printf("number of ID : %d\n", count);
	printf("number of NUM : %d\n", numCount);
    
	return 0;
}