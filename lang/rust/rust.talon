mode: user.rust
mode: command
and code.language: rust
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic

settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    # user.code_protected_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    # user.code_protected_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"
    user.code_class_name_formatter = "PUBLIC_CAMEL_CASE"

action(user.code_line_end):
  edit.line_end()
  insert(";")

action(user.code_is_not_null): ""

action(user.code_is_null): ""

action(user.code_type_dictionary): ""

action(user.code_state_if):
  insert("if  {}")
  key(left enter up)
  edit.line_end()
  key(left left)

action(user.code_state_else_if):
  insert(" else if  {}")
  key(left enter up)
  edit.line_end()
  key(left left)

action(user.code_state_else):
  insert(" else {}")
  key(left enter)

action(user.code_block):
  insert("{}")
  key(left enter)

action(user.code_self): "self"
action(user.code_self_dot): "self."

action(user.code_state_while):
  insert("while  {}")
  key(left enter up)
  edit.line_end()
  key(left left)

action(user.code_state_return):
  insert("return ;")
  key(left)

action(user.code_state_for):
  insert("for  {}")
  key(left enter up)
  edit.line_end()
  key(left left)

action(user.code_state_switch):
  insert("match  {}")
  key(left enter up)
  edit.line_end()
  key(left left)

action(user.code_state_case): ""

action(user.code_state_go_to): ""

action(user.code_import):
  insert("use ;")
  key(left)

action(user.code_from_import): ""

action(user.code_type_class): ""

action(user.code_include): ""

action(user.code_include_system): ""

action(user.code_include_local): ""

action(user.code_type_definition): ""

action(user.code_typedef_struct): "struct "

action(user.code_state_for_each): ""

action(user.code_break): "break;"
action(user.code_next): "continue;"
action(user.code_true): "true"
action(user.code_false): "false"

action(user.code_null): ""

action(user.code_operator_indirection): ""
action(user.code_operator_address_of): ""
action(user.code_operator_structure_dereference): ""
action(user.code_operator_lambda):
    insert("||")
    key(left)
action(user.code_operator_subscript):
  insert("[]")
  key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " && "
action(user.code_operator_or): " || "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_exclusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "

action(user.code_comment): "//"
action(user.code_block_comment):
    insert("/*")
    key(enter)
    key(enter)
    insert("*/")
    edit.up()

state module <user.text>:
  insert("mod ")
  insert(user.formatted_text(text, "SNAKE_CASE"))
  insert(" {}")
  key(left enter)

macro declarative:
  insert("#[]")
  key(left)
macro call <user.text>:
  insert(text)
  insert("!")

implement:
  insert("impl  {}")
  key(left enter up)
  edit.line_end()
  key(left left)

^pub struct <user.text>$:
  insert("pub struct ")
  insert(user.formatted_text(text, "PUBLIC_CAMEL_CASE"))
^pre struct <user.text>$:
  insert("struct ")
  insert(user.formatted_text(text, "PUBLIC_CAMEL_CASE"))

^pub enumerator <user.text>$:
  insert("pub enum ")
  insert(user.formatted_text(text, "PUBLIC_CAMEL_CASE"))
  insert(" {}")
  key(left enter)
^pre enumerator <user.text>$:
  insert("enum ")
  insert(user.formatted_text(text, "PUBLIC_CAMEL_CASE"))
  insert(" {}")
  key(left enter)

state match: user.code_state_switch()
state unsafe:
  insert("unsafe {{  }}")
  key(left left)

very const <user.text>:
  insert("const ")
  insert(user.formatted_text(text, "CAP_SNAKE_CASE"))
  insert(": ")
very let <user.text>:
  insert("let ")
  insert(user.formatted_text(text, "SNAKE_CASE"))
  insert(" = ")

borrow mutt: insert("&mut ")
byte string: insert("b''")

^funky <user.text>$: user.code_private_function(text)
^pre funky <user.text>$: user.code_private_function(text)
^pub funky <user.text>$: user.code_public_function(text)