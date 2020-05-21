syntax keyword type1 integer unsigned signed byte
syntax keyword statement1 foreach if then else elseif while repeat until disable always inital
syntax match comment1 /\/\/.*/
syntax match identifier1 "\t"

highlight link type1 type
highlight link statement1 Statement
highlight link comment1 Comment
highlight link identifier1 Error

syntax match longword1 "\w\{13,}"
highlight link longword1 Error

syntax match longline1 "^.\{80,}$"
highlight link longline1 Error

