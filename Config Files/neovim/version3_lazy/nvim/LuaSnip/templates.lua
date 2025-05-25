local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
return {
	ls.add_snippets("tex",
		{
		s("mat243", {
			t({
				"\\documentclass{article}",
				"\\usepackage{fancyhdr,color,amsmath,amssymb}",
				"",
				"\\pagestyle{fancy}",
				"\\chead{ID \\#"
				}),
			i(1, "1232289086"),
			t({" -  Written Homework \\#"}),
			i(2, "1"),
			t({"}",
				"\\begin{document}",
				"",
				"\\begin{enumerate}",
				"",
				"",
			}),
			i(3),
			t({
				"",
				"",
				"\\end{enumerate}",
				"",
				"\\end{document}"
			})
		})
		,
		s("cse240",{
			t({
				"\\documentclass{article}",
				"\\usepackage{fancyhdr,color,amsmath,amssymb}",
				"",
				"\\pagestyle{fancy}",
				"\\chead{CSE240 - ID \\#"}),
			i(1, "1232289086"),
			t({" -   A\\#"}),
			i(2, "1"),
			t({"}",
				"\\begin{document}",
				"",
				"\\begin{enumerate}",
				"",
				"",
			}),
			i(3),
			t({
				"",
				"",
				"\\end{enumerate}",
				"",
				"\\end{document}"
			})
		}
		)
		})
}
