os: windows
app: vscode
-
# Search
search match: key(alt-r)
search case: key(alt-c)
search word: key(alt-w)
search symbol [<user.text>]:
    key(ctrl-shift-o)
    insert(user.text or "")

# TODO: this should probably be a generic editor command
go match: key(ctrl-alt-shift-m)
