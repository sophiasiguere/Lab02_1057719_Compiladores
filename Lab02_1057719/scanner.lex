
And [Aa][Nn][Dd]
Or [Oo][Rr]
Not [Nn][Oo][Tt]
True [Tt][Rr][Uu][Ee]
False [Ff][Aa][Ll][Ss][Ee]

%%
[\n()]    return yytext[0];
[ \t]		;
{And}	{ return AND;}
{Or}	{ return OR;}
{Not}	{return NOT;}
{True}	{yylval = 1; return (TRUE);}
{False} {yylval = 0; return (FALSE);}
.		{return ERROR;};
%%

int yywrap(void)
{
	return 0;
}


