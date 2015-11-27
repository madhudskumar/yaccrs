%{
#include <stdio.h>
%}

%%
line:
| line exp '\n' {
		 printf("\nValid\n");
		 return 0;
		}

exp:
| 'a'exp'b'

;
%%

main()
{
	printf("\nEnter an expression\n");
	yyparse();
}

yylex()
{
	char c = getchar();
	
	return c;
}

yyerror()
{
	printf("\nInvalid expression\n");
	return -1;
}
