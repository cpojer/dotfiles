local M = {}

local function can_write(bufnr)
  return vim.api.nvim_buf_is_valid(bufnr)
    and vim.bo[bufnr].modifiable
    and vim.bo[bufnr].buftype == ""
    and vim.api.nvim_buf_get_name(bufnr) ~= ""
end

function M.save()
  local bufnr = vim.api.nvim_get_current_buf()
  if not can_write(bufnr) then
    return
  end

  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({
      async = false,
      bufnr = bufnr,
      lsp_format = "fallback",
      timeout_ms = 1000,
    })
  end

  vim.cmd.write()
end

function M.save_from_insert()
  vim.cmd.stopinsert()
  M.save()
end

function M.close_buffer()
  vim.cmd.bdelete()
end

function M.close_buffer_from_insert()
  vim.cmd.stopinsert()
  M.close_buffer()
end

function M.toggle_sidebar()
  vim.cmd("Neotree toggle source=filesystem position=left")
end

function M.toggle_sidebar_from_insert()
  vim.cmd.stopinsert()
  M.toggle_sidebar()
end

function M.rename_symbol()
  vim.lsp.buf.rename()
end

function M.rename_symbol_from_insert()
  vim.cmd.stopinsert()
  M.rename_symbol()
end

function M.select_line()
  vim.cmd.normal({ args = { "V" }, bang = true })
end

function M.select_line_from_insert()
  vim.cmd.stopinsert()
  M.select_line()
end

function M.duplicate_line_down()
  vim.cmd("t.")
end

function M.duplicate_line_down_from_insert()
  vim.cmd.stopinsert()
  M.duplicate_line_down()
end

function M.move_line_down()
  vim.cmd("move +1")
  vim.cmd.normal({ args = { "==" }, bang = true })
end

function M.move_line_down_from_insert()
  vim.cmd.stopinsert()
  M.move_line_down()
end

function M.move_line_up()
  vim.cmd("move -2")
  vim.cmd.normal({ args = { "==" }, bang = true })
end

function M.move_line_up_from_insert()
  vim.cmd.stopinsert()
  M.move_line_up()
end

return M
