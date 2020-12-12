from talon import Context, Module, actions, settings

mod = Module()
ctx = Context()
ctx.matches = r"""
mode: user.php
mode: command
and code.language: php
mode: command
and code.language: phtml
"""

ctx.lists["user.code_functions"] = {
    "dump": "Log::vdlm",
    "debug": "Log::debug",
    "error": "Log::error",
    "map": "array_map",
    "index": "idx",
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

    def code_protected_function(text: str):
        code_function(text, "protected")

    def code_public_function(text: str):
        code_function(text, "public")

def code_function(name: str, privacy=None):
    formatted_name = actions.user.formatted_text(
        name, settings.get("user.code_{}_function_formatter".format(
            privacy
        ))
    )

    if privacy:
        result = "{} function {}".format(
            privacy, formatted_name
        )
    else:
        result = "function {}".format(formatted_name)

    actions.user.paste("{}():  {{\n}}".format(result))
    actions.edit.up()
    actions.edit.line_end()
    actions.edit.left()
    actions.edit.left()
    # insert_cursor("{}(): [|] {{\n}}".format(result))
    # actions.edit.left()
    # actions.key("enter")

@mod.action_class
class module_actions:
    # TODO this could go somewhere else
    def insert_cursor(text: str):
        """Insert a string. Leave the cursor wherever [|] is in the text"""
        insert_cursor(text)

def insert_cursor(text: str):
    if "[|]" in text:
        end_pos = text.find("[|]")
        s = text.replace("[|]", "")
        actions.insert(s)
        actions.key(f"left:{len(s) - end_pos}")
    else:
        actions.insert(text)
