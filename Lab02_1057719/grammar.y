%{
	#include <ctype.h>
	#include <stdio.h>
	#include <stdlib.h>
	extern int yylex();
	void yyerror (char *msg);
%}

%token AND OR NOT TRUE FALSE boolean ERROR

%%

lines : lines expr '\n'   {printf($2 ? "True(1)\n" : "False(0)\n") ;}
      | lines '\n'
	  | lines errorr '\n' 
	  |
	  ;

errorr: ERROR {printf("Error lexico"); exit(0)}; 

expr  : expr OR term    { $$ = $1 || $3 }
      | term;
	  
term  : term AND factor { $$ = $1 && $3}
      | factor;

factor : NOT factor      {$$ = !$2}
       | '(' expr ')' 	{$$ = $2}
	   | TRUE			{$$=$1}
	   | FALSE			{$$=$1};


%%

#include "lex.yy.c";

void yyerror(char *msg)
{
	printf("Error de sintaxis");
	exit(0);
}

main()
{
	yyparse();
	return 0;
}