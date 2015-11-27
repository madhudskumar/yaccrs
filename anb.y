%{
#include <stdio.h>
int count = 1;
%}

%%
line:
| line acnt'b' {
		if(count > 10) printf("\nvalid\n");
		else yyerror();
		
		return 0;	
	     }

acnt:
| 'a'acnt {count++;}

;
%%

main()
{
	printf("\nEnter a expression\n");
	yyparse();
}

yylex()
{
	char c = getchar();
	return c;
}

yyerror()
{
	printf("\nInvalid\n");
	return -1;
}
