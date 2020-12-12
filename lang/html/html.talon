mode: user.html
mode: command
and code.language: html
mode: command
and code.language: phtml
mode: command
and code.language: typescript-react
mode: command
and code.language: javascript-react
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic

action(user.code_line_end):
  edit.line_end()

action(user.code_is_not_null): ""

action(user.code_is_null): ""

action(user.code_type_dictionary): ""

action(user.code_state_if): ""

action(user.code_state_else_if): ""

action(user.code_state_else): ""

action(user.code_block):
  insert("<>")
  key(left)

action(user.code_self): ""
action(user.code_self_dot): ""

action(user.code_state_while): ""

action(user.code_state_return): ""

action(user.code_state_for): ""

action(user.code_state_switch): ""

action(user.code_state_case): ""

action(user.code_state_go_to): ""

action(user.code_import): ""

action(user.code_from_import): ""

action(user.code_type_class): ""

action(user.code_include): ""

action(user.code_include_system): ""

action(user.code_include_local): ""

action(user.code_type_definition): ""

action(user.code_typedef_struct): ""

action(user.code_state_for_each): ""

action(user.code_break): ""
action(user.code_next): ""
action(user.code_true): ""
action(user.code_false): ""

action(user.code_null): ""

action(user.code_operator_indirection): ""
action(user.code_operator_address_of): ""
action(user.code_operator_structure_dereference): ""
action(user.code_operator_lambda): ""
action(user.code_operator_subscript): ""
action(user.code_operator_assignment): ""
action(user.code_operator_subtraction): ""
action(user.code_operator_subtraction_assignment): ""
action(user.code_operator_addition): ""
action(user.code_operator_addition_assignment): ""
action(user.code_operator_multiplication): ""
action(user.code_operator_multiplication_assignment): ""
action(user.code_operator_exponent): ""
action(user.code_operator_division): ""
action(user.code_operator_division_assignment): ""
action(user.code_operator_modulo): ""
action(user.code_operator_modulo_assignment): ""
action(user.code_operator_equal): ""
action(user.code_operator_not_equal): ""
(op | is) strict equal: ""
(op | is) strict not equal: ""
action(user.code_operator_greater_than): ""
action(user.code_operator_greater_than_or_equal_to): ""
action(user.code_operator_less_than): ""
action(user.code_operator_less_than_or_equal_to): ""
action(user.code_operator_and): ""
action(user.code_operator_or): ""
action(user.code_operator_bitwise_and): ""
action(user.code_operator_bitwise_and_assignment): ""
action(user.code_operator_bitwise_or): ""
action(user.code_operator_bitwise_or_assignment): ""
action(user.code_operator_bitwise_exclusive_or): ""
action(user.code_operator_bitwise_exclusive_or_assignment): ""
action(user.code_operator_bitwise_left_shift): ""
action(user.code_operator_bitwise_left_shift_assignment): ""
action(user.code_operator_bitwise_right_shift): ""
action(user.code_operator_bitwise_right_shift_assignment): ""

# "meta" gets picked up as "matter"
tag matter: user.insert_closed_tag("meta")
# "head" gets picked up as "had"
tag had: user.insert_closed_tag("head")
tag link: user.insert_unclosed_tag("link")
tag style: user.insert_unclosed_tag("style")
tag script: user.insert_closed_tag("script")
tag body: user.insert_closed_tag("body")
tag title: user.insert_closed_tag("title")
tag header: user.insert_closed_tag("header")
tag footer: user.insert_closed_tag("footer")
tag navigate: user.insert_closed_tag("nav")

tag horizontal: user.insert_unclosed_tag("hr")
tag break: user.insert_unclosed_tag("br")

tag list: user.insert_closed_tag("ol")
tag unordered list: user.insert_closed_tag("ul")
tag list element: user.insert_closed_tag("li")

tag divide: user.insert_closed_tag("div")
tag span: user.insert_closed_tag("span")
tag paragraph: user.insert_closed_tag("p")
tag pre: user.insert_closed_tag("pre")
tag anchor: user.insert_closed_tag("a")
tag time: user.insert_closed_tag("time")
tag code: user.insert_closed_tag("code")

tag image: user.insert_unclosed_tag("img")
tag video: user.insert_unclosed_tag("video")

tag header one: user.insert_closed_tag("h1")
tag header two: user.insert_closed_tag("h2")
tag header three: user.insert_closed_tag("h3")
tag header four: user.insert_closed_tag("h4")
tag header five: user.insert_closed_tag("h5")
tag header six: user.insert_closed_tag("h6")

tag table: user.insert_closed_tag("table")
tag table body: user.insert_closed_tag("tbody")
tag table header: user.insert_closed_tag("thead")
tag table header column: user.insert_closed_tag("th")
tag table row: user.insert_closed_tag("tr")
tag table column: user.insert_closed_tag("td")

tag button: user.insert_closed_tag("button")
tag input: user.insert_unclosed_tag("input")
tag form: user.insert_closed_tag("form")
tag label: user.insert_closed_tag("label")
tag select: user.insert_closed_tag("select")
tag option: user.insert_closed_tag("option")
tag text: user.insert_closed_tag("textarea")