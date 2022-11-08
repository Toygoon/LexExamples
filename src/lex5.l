%{
#include <strings.h>

int longest = 0;
char longword[128];
%}
%option noyywrap

%%

\"(\.|[^"\\])\"		{
			// recognizes the matching strings with the rules below
			// \" : starts with the "
			// (
			// \. : exclude the escape characters
			// | : or
			// "\\ : not with "\
			// \" : ends with the "
			if(yyleng > longest) {
				longest = yyleng;
				strcpy(longword, yytext);
			}
		}
.	;
\n	;

%%

int main() {
	yylex();
	printf("Longest word : %s, %d\n", longword, longest);

	return 0;
}
