from talon import Context

# from user.knausj_talon.code.snippet_watcher import snippet_watcher
# import os

ctx = Context()
ctx.matches = r"""
app: vscode
mode: user.php
mode: command
and code.language: php
"""
# short name -> ide clip name
ctx.lists["user.snippets"] = {
    "class": "nclass",
    "constructor": "cstr",
    "pub funky": "pub",
    "pub static funky": "spub",
    "pre funky": "pri",
    "pre static funky": "spri",
    "pro funky": "pro",
    "pro static funky": "spro",
    "anonymous funky": "fun",
    "arrow funky": "fn",
    "test case": "test",

    "very": "va",
    "pre very": "rva",
    "pro very": "ova",
    "pub very": "pva",
    "parameter": "pa",

    "if": "ifs",
    "switch": "switch",
    "for": "fr",
    "for each": "fre",
    "for each key value": "frek",
    "map": "ma",
    "try catch": "tr",
    "try catch finally": "trf",
}
