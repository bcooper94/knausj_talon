from talon import Context, Module

mod = Module()
ctx = Context()
ctx.matches = r"""
mode: user.phtml
mode: command
and code.language: phtml
"""
