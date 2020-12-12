mode: user.phtml
mode: command
and code.language: phtml
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic

state evaluate:
    insert("<?  ?>")
    key(left left left)
state output:
    insert("<?=  ?>")
    key(left left left)
