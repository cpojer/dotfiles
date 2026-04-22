local M = {}

local palettes = {
  licht = {
    background = "light",
    bg = "#fffefc",
    fg = "#111111",
    muted = "#919191",
    line = "#adadad",
    cursorline = "#f3f3f3",
    selection = "#c2e8ff",
    selection_soft = "#e6f4ff",
    border = "#aacbdf",
    accent = "#3d87f5",
    accent_2 = "#284181",
    keyword = "#352de3",
    type = "#c56e0e",
    const = "#626fc9",
    func = "#284181",
    class = "#bb28c7",
    number = "#dd3c2f",
    string = "#00a33f",
    regexp = "#699d36",
    property = "#444444",
    tag = "#0072c8",
    tag_delim = "#4f9fcf",
    error = "#cd3131",
    warn = "#bc670f",
    info = "#3d87f5",
    hint = "#699d36",
    menu = "#f3f3f3",
    status = "#3d87f5",
  },
  dunkel = {
    background = "dark",
    bg = "#141414",
    fg = "#c8c8c8",
    muted = "#919191",
    line = "#adadad",
    cursorline = "#202020",
    selection = "#23466f",
    selection_soft = "#1c3552",
    border = "#3d87f5",
    accent = "#3d87f5",
    accent_2 = "#1d4175",
    keyword = "#6a93cf",
    type = "#eb9a3d",
    const = "#7b8cfd",
    func = "#7b8cfd",
    class = "#f06efb",
    number = "#db584d",
    string = "#52ce81",
    regexp = "#699d36",
    property = "#949494",
    tag = "#6a93cf",
    tag_delim = "#4f9fcf",
    error = "#db584d",
    warn = "#eb9a3d",
    info = "#3d87f5",
    hint = "#52ce81",
    menu = "#252526",
    status = "#1d4175",
  },
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function apply(name)
  local palette = palettes[name] or palettes.dunkel

  vim.o.background = palette.background
  vim.g.colors_name = name

  hi("Normal", { fg = palette.fg, bg = palette.bg })
  hi("NormalNC", { fg = palette.fg, bg = palette.bg })
  hi("SignColumn", { bg = palette.bg })
  hi("EndOfBuffer", { fg = palette.bg, bg = palette.bg })
  hi("CursorLine", { bg = palette.cursorline })
  hi("CursorColumn", { bg = palette.cursorline })
  hi("CursorLineNr", { fg = palette.fg, bold = true })
  hi("LineNr", { fg = palette.line })
  hi("ColorColumn", { bg = palette.cursorline })
  hi("Cursor", { fg = palette.bg, bg = palette.accent })
  hi("Visual", { bg = palette.selection })
  hi("Search", { fg = palette.fg, bg = "#ffe792" })
  hi("IncSearch", { fg = palette.fg, bg = "#ffe792" })
  hi("MatchParen", { fg = palette.class, bold = true, underline = true })
  hi("Whitespace", { fg = palette.line })
  hi("NonText", { fg = palette.line })
  hi("Directory", { fg = palette.accent_2, bold = true })
  hi("Title", { fg = palette.func, bold = true })
  hi("ErrorMsg", { fg = palette.error, bold = true })
  hi("WarningMsg", { fg = palette.warn, bold = true })
  hi("WinSeparator", { fg = palette.border, bg = palette.bg })
  hi("VertSplit", { fg = palette.border, bg = palette.bg })
  hi("Folded", { fg = palette.muted, bg = palette.cursorline })
  hi("StatusLine", { fg = palette.fg, bg = palette.menu })
  hi("StatusLineNC", { fg = palette.muted, bg = palette.menu })
  hi("TabLineFill", { fg = palette.muted, bg = palette.menu })
  hi("Pmenu", { fg = palette.fg, bg = palette.menu })
  hi("PmenuSel", { fg = palette.fg, bg = palette.selection })
  hi("PmenuThumb", { bg = palette.accent })
  hi("NormalFloat", { fg = palette.fg, bg = palette.menu })
  hi("FloatBorder", { fg = palette.border, bg = palette.menu })

  hi("Comment", { fg = palette.muted, italic = false })
  hi("Constant", { fg = palette.number })
  hi("String", { fg = palette.string })
  hi("Character", { fg = palette.string })
  hi("Number", { fg = palette.number })
  hi("Boolean", { fg = palette.const })
  hi("Float", { fg = palette.number })
  hi("Identifier", { fg = palette.fg })
  hi("Function", { fg = palette.func })
  hi("Statement", { fg = palette.keyword })
  hi("Conditional", { fg = palette.keyword })
  hi("Repeat", { fg = palette.keyword })
  hi("Label", { fg = palette.keyword })
  hi("Operator", { fg = palette.keyword })
  hi("Keyword", { fg = palette.keyword })
  hi("Exception", { fg = palette.error })
  hi("PreProc", { fg = palette.keyword })
  hi("Type", { fg = palette.type })
  hi("Special", { fg = palette.class })
  hi("Delimiter", { fg = palette.fg })
  hi("Tag", { fg = palette.tag })

  hi("@comment", { link = "Comment" })
  hi("@keyword", { link = "Keyword" })
  hi("@keyword.function", { fg = palette.keyword })
  hi("@operator", { link = "Operator" })
  hi("@type", { link = "Type" })
  hi("@type.builtin", { fg = palette.type })
  hi("@variable", { fg = palette.fg })
  hi("@variable.builtin", { fg = palette.const })
  hi("@constant", { fg = palette.number })
  hi("@constant.builtin", { fg = palette.const })
  hi("@property", { fg = palette.property })
  hi("@field", { fg = palette.property })
  hi("@function", { fg = palette.func })
  hi("@function.builtin", { fg = palette.func })
  hi("@constructor", { fg = palette.class })
  hi("@string", { fg = palette.string })
  hi("@string.escape", { fg = palette.warn, bold = true })
  hi("@string.regex", { fg = palette.regexp })
  hi("@number", { fg = palette.number })
  hi("@boolean", { fg = palette.const })
  hi("@punctuation", { fg = palette.fg })
  hi("@tag", { fg = palette.tag })
  hi("@tag.attribute", { fg = palette.type })
  hi("@tag.delimiter", { fg = palette.tag_delim })

  hi("DiagnosticError", { fg = palette.error })
  hi("DiagnosticWarn", { fg = palette.warn })
  hi("DiagnosticInfo", { fg = palette.info })
  hi("DiagnosticHint", { fg = palette.hint })
  hi("DiagnosticUnderlineError", { undercurl = true, sp = palette.error })
  hi("DiagnosticUnderlineWarn", { undercurl = true, sp = palette.warn })
  hi("DiagnosticUnderlineInfo", { undercurl = true, sp = palette.info })
  hi("DiagnosticUnderlineHint", { undercurl = true, sp = palette.hint })
  hi("DiagnosticVirtualTextError", { fg = palette.error, bg = "NONE" })
  hi("DiagnosticVirtualTextWarn", { fg = palette.warn, bg = "NONE" })
  hi("DiagnosticVirtualTextInfo", { fg = palette.info, bg = "NONE" })
  hi("DiagnosticVirtualTextHint", { fg = palette.hint, bg = "NONE" })

  hi("NeoTreeNormal", { fg = palette.fg, bg = palette.bg })
  hi("NeoTreeNormalNC", { fg = palette.fg, bg = palette.bg })
  hi("NeoTreeFloatBorder", { fg = palette.border, bg = palette.menu })
  hi("NeoTreeFloatTitle", { fg = palette.fg, bg = palette.menu, bold = true })
  hi("NeoTreeTitleBar", { fg = palette.fg, bg = palette.menu, bold = true })
  hi("NeoTreeDirectoryName", { fg = palette.accent_2, bold = true })
  hi("NeoTreeDirectoryIcon", { fg = palette.accent })
  hi("NeoTreeIndentMarker", { fg = palette.line })
  hi("NeoTreeGitAdded", { fg = palette.hint })
  hi("NeoTreeGitDeleted", { fg = palette.error })
  hi("NeoTreeGitModified", { fg = palette.warn })

  hi("TelescopeNormal", { fg = palette.fg, bg = palette.menu })
  hi("TelescopeBorder", { fg = palette.border, bg = palette.menu })
  hi("TelescopePromptBorder", { fg = palette.border, bg = palette.menu })
  hi("TelescopeResultsBorder", { fg = palette.border, bg = palette.menu })
  hi("TelescopePreviewBorder", { fg = palette.border, bg = palette.menu })
  hi("TelescopePromptNormal", { fg = palette.fg, bg = palette.menu })
  hi("TelescopePromptTitle", { fg = palette.bg, bg = palette.accent, bold = true })
  hi("TelescopeResultsTitle", { fg = palette.bg, bg = palette.accent_2, bold = true })
  hi("TelescopePreviewTitle", { fg = palette.bg, bg = palette.class, bold = true })
  hi("TelescopeSelection", { fg = palette.fg, bg = palette.selection_soft })
  hi("TelescopeMatching", { fg = palette.class, bold = true })

  hi("BufferLineFill", { bg = palette.menu })
  hi("BufferLineBackground", { fg = palette.muted, bg = palette.menu })
  hi("BufferLineBufferVisible", { fg = palette.fg, bg = palette.menu })
  hi("BufferLineBufferSelected", { fg = palette.fg, bg = palette.bg, bold = true })
  hi("BufferLineSeparator", { fg = palette.menu, bg = palette.menu })
  hi("BufferLineSeparatorVisible", { fg = palette.menu, bg = palette.menu })
  hi("BufferLineSeparatorSelected", { fg = palette.menu, bg = palette.bg })
  hi("BufferLineIndicatorSelected", { fg = palette.accent, bg = palette.bg })
  hi("BufferLineCloseButtonSelected", { fg = palette.error, bg = palette.bg })
  hi("BufferLineModifiedSelected", { fg = palette.warn, bg = palette.bg })
  hi("BufferLineTabSelected", { fg = palette.fg, bg = palette.bg, bold = true })
end

function M.apply_system_theme()
  local name = "licht"

  if vim.uv.os_uname().sysname == "Darwin" then
    local result = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()
    if result.code == 0 and result.stdout and result.stdout:match("Dark") then
      name = "dunkel"
    end
  elseif vim.o.background == "dark" then
    name = "dunkel"
  end

  apply(name)
end

function M.setup()
  M.apply_system_theme()

  vim.api.nvim_create_user_command("Licht", function()
    apply("licht")
  end, {})

  vim.api.nvim_create_user_command("Dunkel", function()
    apply("dunkel")
  end, {})

  vim.api.nvim_create_user_command("ThemeSync", function()
    M.apply_system_theme()
  end, {})

  local group = vim.api.nvim_create_augroup("DotfilesThemeSync", { clear = true })
  vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained", "VimResume" }, {
    group = group,
    callback = function()
      M.apply_system_theme()
    end,
  })
end

return M
