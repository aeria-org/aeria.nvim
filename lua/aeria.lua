local runtimepath = vim.api.nvim_list_runtime_paths()[1]
local queriespath = runtimepath .. '/queries/aeria'
local pluginpath = debug.getinfo(1).source:sub(2, -15)
local pluginqueriespath = pluginpath .. '/ts-dist/queries'
local aeriaSettings = vim.api.nvim_create_augroup('Aeria Settings', { clear = true })

vim.filetype.add({
    extension = {
      aeria = 'aeria'
    }
})

vim.treesitter.language.add('aeria', {
    path = pluginpath .. '/ts-dist/aeria.so',
    filetype = 'aeria'
})

if vim.fn.isdirectory(queriespath) == 0 then
  vim.fn.mkdir(queriespath, 'p')

  for k, v in pairs(vim.fn.readdir(pluginqueriespath)) do
    local file = pluginqueriespath .. '/' .. v
    local bufnr = vim.fn.bufadd(file)
    vim.fn.bufload(bufnr)
    vim.api.nvim_buf_call(bufnr, function()
      vim.cmd.write(queriespath .. '/' .. v)
    end)
  end
end

vim.api.nvim_create_autocmd({
    'BufNewFile',
    'BufRead',
  },
  {
  pattern = { '*.aeria' },
  callback = function()
    vim.treesitter.start()
  end,
  group = aeriaSettings
})

