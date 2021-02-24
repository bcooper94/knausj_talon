os: mac
app: vscode
-
# Search
search match: key(alt-cmd-r)
search case: key(alt-cmd-c)
search word: key(alt-cmd-w)
search symbol [<user.text>]:
    key(cmd-shift-o)
    insert(user.text or "")

# TODO: this should probably be a generic editor command
go match: key(shift-cmd-\)
