/* Alguns/* Alguns métodos e variáveis disponíveis:
 * int yyline: armazena o número da linha atual.
 * int yycolumn: armazena o número da coluna atual na linha atual.
 * String yytext(): método que retorna a sequência de caracteres que foi casada com a regra.
 * int yylength(): método que retorna o comprimento da sequência de caracteres que foi casada com a regra.
 */

/* 
 * Definição: seção para código do usuário. 
 */

import token.Token;
%%

/* 
 * Opções e Declarações: seção para diretivas e macros. 
 */

// Diretivas:
%standalone         // Execução independente do analisador sintático.
%line               // Permite usar yyline.
%column             // Permite usar yycolumn.
%class Scanner      // Troca o nome da classe Yylex para Scanner.

%{
  Token token;
%}

// Macros:
BRANCO = [\n| |\t|\r]
PONTOEVIRGULA = ";"
ABREPARENTESE = "("
FECHAPARENTESE = ")"
ASPAS = "'"
VIRGULA = ","
SOMA = "+"
MENORQUE = "<"
ATRIBUICAO = ":="
MULTIPLICACAO = "*"
SUBTRACAO = "-"
DIVISAO = "/"
INTEIRO = 0|[1-9][0-9]*
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*


%%

/*  
 * Regras e Ações Associadas: seção de instruções para
 * o analisador léxico. 
 */
{ABREPARENTESE}  { token = new Token(yyline, yycolumn, yytext(), "Abre parêntese"); token.imprimir(); }
{FECHAPARENTESE} { token = new Token(yyline, yycolumn, yytext(), "Fecha parêntese"); token.imprimir(); }
{PONTOEVIRGULA}  { token = new Token(yyline, yycolumn, yytext(), "Ponto e vírgula"); token.imprimir(); }
{ATRIBUICAO}     { token = new Token(yyline, yycolumn, yytext(), "Atribuição"); token.imprimir(); }
{MENORQUE}       { token = new Token(yyline, yycolumn, yytext(), "Menor que"); token.imprimir(); }
{VIRGULA}        { token = new Token(yyline, yycolumn, yytext(), "Virgula"); token.imprimir(); }
{ASPAS}          { token = new Token(yyline, yycolumn, yytext(), "Aspas"); token.imprimir(); }
{MULTIPLICACAO}  { token = new Token(yyline, yycolumn, yytext(), "Multiplicacao"); token.imprimir(); }   
{SUBTRACAO}      { token = new Token(yyline, yycolumn, yytext(), "Substracao"); token.imprimir(); }
{DIVISAO}        { token = new Token(yyline, yycolumn, yytext(), "Divisao"); token.imprimir(); }
"if"             { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada if"); token.imprimir(); }
"then"           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada then"); token.imprimir(); }
"else"           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada else"); token.imprimir(); }
"begin"          { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada begin"); token.imprimir(); }
"end"            { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada end"); token.imprimir(); }
{BRANCO}         { token = new Token(yyline, yycolumn, yytext(), "Espaço em branco"); token.imprimir(); }
{ID}             { token = new Token(yyline, yycolumn, yytext(), "Identificador"); token.imprimir(); }
{SOMA}           { token = new Token(yyline, yycolumn, yytext(), "Operador de soma"); token.imprimir(); }
{INTEIRO}        { token = new Token(yyline, yycolumn, yytext(), "Número inteiro"); token.imprimir(); }
.                { token = new Token(yyline, yycolumn, yytext(), "Caracter inválido"); token.dispararExcecao(); }
