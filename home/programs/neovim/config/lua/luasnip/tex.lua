local helpers = require("luasnip_helper")
local get_visual = helpers.get_visual
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
-- local get_visual = function(args, parent)
-- 	if #parent.snippet.env.LS_SELECT_RAW > 0 then
-- 		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
-- 	else -- If LS_SELECT_RAW is empty, return a blank insert node
-- 		return sn(nil, i(1))
-- 	end
-- end
local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
	return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
	return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
	return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
	return tex_utils.in_env("tikzpicture")
end

return {
	-- Examples of Greek letter snippets, autotriggered for efficiency
	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	}),
	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	}),
	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	}),
	-- \texttt
	s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" }, fmta("\\texttt{<>}", { i(1) })),
	-- \frac
	-- s(
	-- 	{ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
	-- 	fmt(
	-- 		"\\frac{<>}{<>}",
	-- 		{
	-- 			i(1),
	-- 			i(2),
	-- 		},
	-- 		{ delimiters = "<>" } -- manually specifying angle bracket delimiters
	-- 	)
	-- ),
	-- s(
	-- 	{ trig = "([^%a])ff", regTrig = true, wordTrig = false },
	-- 	fmta([[<>\frac{<>}{<>}]], {
	-- 		f(function(_, snip)
	-- 			return snip.captures[1]
	-- 		end),
	-- 		i(1),
	-- 		i(2),
	-- 	})
	-- ),
	-- Another take on the fraction snippet without using a regex trigger
	s(
		{ trig = "ff" },
		fmta("\\frac{<>}{<>}", {
			i(1),
			i(2),
		}),
		{ condition = in_mathzone } -- `condition` option passed in the snippet `opts` table
	),
	s(
		{ trig = "dd" },
		fmta("\\draw [<>] ", {
			i(1, "params"),
		}),
		{ condition = tex_utils.in_tikz }
	),
	-- Equation
	s(
		{ trig = "eq", dscr = "Expands 'eq' into an equation environment" },
		fmta(
			[[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
			{ i(1) }
		)
	),
	-- Code for environment snippet in the above GIF
	-- s({trig="env", snippetType="autosnippet"},
	--   fmta(
	--     [[
	--       \begin{<>}
	--           <>
	--       \end{<>}
	--     ]],
	--     {
	--       i(1),
	--       i(2),
	--       rep(1),  -- this node repeats insert node i(1)
	--     }
	--   )
	-- ),
	s(
		{ trig = "h1", dscr = "Top-level section" },
		fmta([[\section{<>}]], { i(1) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),

	s(
		{ trig = "new", dscr = "A generic new environmennt" },
		fmta(
			[[
      \begin{<>}
          <>
      \end{<>}
    ]],
			{
				i(1),
				i(2),
				rep(1),
			}
		),
		{ condition = line_begin }
	),
	-- Example use of insert node placeholder text
	s(
		{ trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
		fmta([[\href{<>}{<>}]], {
			i(1, "url"),
			i(2, "display name"),
		})
	),
	-- Example: italic font implementing visual selection
	s(
		{ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textit{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{ trig = "([^%a])mm", wordTrig = false, regTrig = true },
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
	s(
		{ trig = "([^%a])ee", regTrig = true, wordTrig = false },
		fmta("<>e^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
}
