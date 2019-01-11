syn match     cppModPath     "\w\(\w\)*::[^<]"he=e-3,me=e-3
syn match     cppModPathSep  "::"
hi link cppModPath Special
hi link cppModPathSep Special

syn match     cppFnCall    "\w\(\w\)*("he=e-1,me=e-1
hi link cppFnCall Identifier

syn match cppRightArrowHead "->" conceal cchar=⟶

setlocal conceallevel=2
