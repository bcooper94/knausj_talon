import time
from talon import Context, Module, actions, clip, ui

ctx = Context()
mod = Module()


@ctx.action_class("edit")
class edit_actions:
    def selected_text() -> str:
        with clip.capture() as s:
            actions.edit.copy()
        try:
            return s.get()
        except clip.NoChange:
            return ""

    # TODO: Figure out how to get this working
    # def insert_cursor(text: str):
    #     """Insert a string. Leave the cursor wherever [|] is in the text"""
    #     if "[|]" in text:
    #         end_pos = text.find("[|]")
    #         s = text.replace("[|]", "")
    #         actions.insert(s)
    #         actions.key(f"left:{len(s) - end_pos}")
    #     else:
    #         actions.insert(text)

@mod.action_class
class Actions:
    def paste(text: str):
        """Pastes text and preserves clipboard"""

        with clip.revert():
            clip.set_text(text)
            actions.edit.paste()
            # sleep here so that clip.revert doesn't revert the clipboard too soon
            actions.sleep("150ms")
