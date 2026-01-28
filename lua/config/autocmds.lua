-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local group = vim.api.nvim_create_augroup("zxw_augroup", { clear = true })

local function setup_mysql_client_integration()
  local file_name = vim.fn.expand("%:t")

  -- Check if the filename starts with 'sql' (MySQL client often uses this prefix)
  local has_sql_prefix = file_name:match("^sql")
  if not has_sql_prefix then
    return
  end

  -- Additional check: see if process that spawned nvim was mysql
  local parent_pid = vim.fn.system("ps -o ppid= -p " .. vim.fn.getpid()):match("%d+")
  local grandparent_pid = vim.fn.system("ps -o ppid= -p " .. parent_pid):match("%d+")
  local is_called_by_mysql =
    vim.fn.system(string.format("ps -o comm= -p %s,%s", parent_pid, grandparent_pid)):match("mysql")

  -- If conditions match, set up MySQL editing environment
  if is_called_by_mysql then
    vim.bo.filetype = "sql"
  end
end

-- Run the function on every buffer read
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = "*",
  group = group,
  callback = setup_mysql_client_integration,
})

vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- ref: https://neovim.io/doc/user/faq.html#_cursor-style-isn't-restored-after-exiting-or-suspending-and-resuming-nvim
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  callback = function()
    vim.opt.guicursor = "a:ver25-blinkwait300-blinkoff300-blinkon250"
  end,
})
