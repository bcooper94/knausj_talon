os: windows
app: vscode
-
# Search
search match: key(alt-ctrl-r)
search case: key(alt-ctrl-c)
search word: key(alt-ctrl-w)
search symbol [<user.text>]:
    key(ctrl-shift-o)
    insert(user.text or "")