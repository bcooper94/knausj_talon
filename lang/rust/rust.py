from talon import Context, Module, actions, settings

mod = Module()
ctx = Context()
ctx.matches = r"""
mode: user.rust
mode: command
and code.language: rust
"""

ctx.lists["user.code_functions"] = {
    "drop": "drop",
}

@ctx.action_class("user")
class user_actions:
    def code_insert_class(name: str):
        result = "class {} {{}}".format(
            actions.user.formatted_text(
                name, settings.get("user.code_class_name_formatter")
            )
        )

        actions.user.paste(result)
        actions.edit.left()
        actions.key("enter")

    def code_insert_function(text: str, selection: str):
        if selection:
            text = text + "({})".format(selection)
        else:
            text = text + "()"
        actions.user.paste(text)
        actions.edit.left()

    def code_private_function(text: str):
        """Inserts private function declaration"""
        code_function(text, "private")

    def code_public_function(text: str):
        code_function(text, "public")

def code_function(name: str, is_public: bool):
    formatter_privacy = "public" if is_public else "private"
    formatted_name = actions.user.formatted_text(
        name, settings.get("user.code_{}_function_formatter".format(
            formatter_privacy
        ))
    )

    if is_public == "public":
        result = "pub fn {}".format(formatted_name)
    else:
        result = "fn {}".format(formatted_name)

    actions.user.paste("{}() {{\n}}".format(result))
    actions.edit.up()
    actions.edit.line_end()
    actions.edit.left()
    actions.edit.left()
    actions.edit.left()
