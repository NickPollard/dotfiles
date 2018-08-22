"syn match cppModOperator "::" conceal cchar=ㆍ
"syn match cppModPath     "\w\(\w\)*::[^<]"he=e-3,me=e-3 conceal cchar=ㆍ

"syn match cppModPath     "\(::\)?\(w\(\w\)*::\)*[^<]"he=e-1,me=e-1 conceal cchar=…




syn match cppModPath     ":*\(\w\(\w\)*::\)\(\w\(\w\)*::\)*[^<]"he=e-1,me=e-1 conceal cchar=…
hi link cppModPath Special
syn match cppRightArrowHead "->" conceal cchar=⟶

setlocal conceallevel=2
