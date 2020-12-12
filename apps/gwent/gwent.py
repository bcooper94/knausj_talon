from talon import Context, actions, ui, Module, app, clip

ctx = Context()
mod = Module()
mod.apps.gwent = "app.name: Gwent.exe"

ctx.matches = r"""
app: gwent
"""
