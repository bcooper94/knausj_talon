tag: user.snippets
-
snippy {user.snippets}: user.snippet_insert(user.snippets)
snippy hunt <user.text>: user.snippet_search(user.text)
snippy hunt: user.snippet_search("")
snippy create: user.snippet_create()
snippy show: user.snippet_toggle()
