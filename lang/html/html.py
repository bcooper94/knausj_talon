from talon import Context, Module, actions

mod = Module()
ctx = Context()
ctx.matches = r"""
mode: user.html
mode: command
and code.language: html
mode: command
and code.language: typescript-react
mode: command
and code.language: javascript-react
"""

@mod.action_class
class module_actions:
    def insert_closed_tag(tag: str):
        """Inserts a closed html tag. Leave the cursor wherever [|] is in the text"""
        return insert_cursor("<{0}>[|]</{0}>".format(tag))

    def insert_unclosed_tag(tag: str):
        """Inserts a closed html tag. Leave the cursor wherever [|] is in the text"""
        return insert_cursor("<{0} [|]/>".format(tag))

# TODO this could go somewhere else
def insert_cursor(text: str):
    """Insert a string. Leave the cursor wherever [|] is in the text"""
    if "[|]" in text:
        end_pos = text.find("[|]")
        s = text.replace("[|]", "")
        actions.insert(s)
        actions.key(f"left:{len(s) - end_pos}")
    else:
        actions.insert(text)