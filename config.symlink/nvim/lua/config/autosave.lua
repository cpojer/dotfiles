local M = {}

local timer = vim.uv.new_timer()
local debounce_ms = 800

local function should_autosave(bufnr)
  return vim.api.nvim_buf_is_valid(bufnr)
    and vim.bo[bufnr].modified
    and vim.bo[bufnr].modifiable
    and vim.bo[bufnr].buftype == ""
    and vim.api.nvim_buf_get_name(bufnr) ~= ""
end

local function write_buffer(bufnr)
  if not should_autosave(bufnr) then
    return
  end

  vim.api.nvim_buf_call(bufnr, function()
    vim.cmd("silent noautocmd update")
  end)
end

local function schedule_autosave(bufnr)
  timer:stop()
  timer:start(
    debounce_ms,
    0,
    vim.schedule_wrap(function()
      write_buffer(bufnr)
    end)
  )
end

function M.setup()
  local group = vim.api.nvim_create_augroup("DotfilesAutosave", { clear = true })

  vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
    group = group,
    callback = function(args)
      if should_autosave(args.buf) then
        schedule_autosave(args.buf)
      end
    end,
  })

  vim.api.nvim_create_autocmd("FocusLost", {
    group = group,
    callback = function()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        write_buffer(bufnr)
      end
    end,
  })
end

return M
