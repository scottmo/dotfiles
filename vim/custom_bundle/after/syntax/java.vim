" Vim syntax file
" Language:	Java Additions
" Maintainer: Shaocong Mo <scottscmo@gmail.com>
" Original_Author:	Mikhail Wolfson <mywolfson@gmail.com>
" Last Change:	2015 Jun. 11
" Version: 0.1
"
" Changelog:
"   0.1 - shamelessly stripped off from Wolfson c.vim for java syntax

" Operators
syn match javaOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match javaOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match javaOperator	"[.!~*&%<>^|=,+-]"
syn match javaOperator	"/[^/*=]"me=e-1
syn match javaOperator	"/$"
syn match javaOperator  "&&\|||"
syn match javaOperator	"[][]"

" Functions
syn match javaFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
hi def link javaFunction Function

syn match javaLambdaDef "[a-zA-Z_][a-zA-Z0-9_]*\s*->"
syn match  javaBraces  "[{}]"
syn cluster javaTop add=javaFuncDef,javaBraces,javaLambdaDef

