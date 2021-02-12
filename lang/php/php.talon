mode: user.php
mode: command
and code.language: php
mode: command
and code.language: phtml
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic

settings():
    user.code_private_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_private_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_class_name_formatter = "PUBLIC_CAMEL_CASE"

action(user.code_line_end):
  edit.line_end()
  insert(";")

action(user.code_is_not_null): " !== null"

action(user.code_is_null): " === null"

action(user.code_type_dictionary):
  insert("[]")
  key(left)

action(user.code_state_if):
  insert("if () {}")
  key(left enter)

action(user.code_state_else_if):
  insert(" else if () {}")
  key(left enter)

action(user.code_state_else):
  insert(" else {}")
  key(left enter)

action(user.code_block):
  insert("{}")
  key(left enter)

action(user.code_self): "$this"
action(user.code_self_dot): "$this->"

action(user.code_state_while):
  insert("while () {}")
  key(left enter)

action(user.code_state_return):
  insert("return ;")
  key(left)

action(user.code_state_for):
  insert("for () {}")
  key(left enter)

action(user.code_state_switch):
  insert("switch () {}")
  key(enter left)

action(user.code_state_case): "case :"

action(user.code_state_go_to): ""

action(user.code_import):
  insert("use ;")
  key(left)

action(user.code_from_import): ""

action(user.code_type_class): "class "

action(user.code_include): ""

action(user.code_include_system): ""

action(user.code_include_local): ""

action(user.code_type_definition): ""

action(user.code_typedef_struct): ""

action(user.code_state_for_each):
  insert("foreach () {}")
  key(left enter)

action(user.code_break): "break;"
action(user.code_next): "continue;"
action(user.code_true): "true"
action(user.code_false): "false"

action(user.code_null): "null"

action(user.code_operator_indirection): ""
action(user.code_operator_address_of): ""
action(user.code_operator_structure_dereference): ""
action(user.code_operator_lambda): " => "
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
(op | is) strict equal: " === "
(op | is) strict not equal: " !== "
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

state new file: "<? declare(strict_types=1);\n"
state name speck:
  insert("namespace ;")
  key(left)
state name speck fix:
  insert("namespace iFixit\;")
  key(left)
state const: "const "
state spread: "..."

state dock comment: "/**"

state new <user.text>:
  insert("new ")
  user.code_class_name_formatter(text)

very <user.text>:
  insert("$")
  user.code_private_variable_formatter(text)

static call <user.text>:
  insert("::")
  user.code_private_function_formatter(text)

method call <user.text>:
  insert("->")
  user.code_private_function_formatter(text)

^funky <user.text>$: user.code_private_function(text)
^pre funky <user.text>$: user.code_private_function(text)
^pro funky <user.text>$: user.code_protected_function(text)
^pub funky <user.text>$: user.code_public_function(text)