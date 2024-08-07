local runtimepath = vim.api.nvim_list_runtime_paths()[1]
local queriespath = runtimepath .. '/queries/aeria'
local pluginpath = debug.getinfo(1).source:sub(2, -15)
local tsdistpath = pluginpath .. '/../dist'
local pluginqueriespath = tsdistpath .. '/queries'
local aeriaSettings = vim.api.nvim_create_augroup('Aeria Settings', { clear = true })

vim.filetype.add({
    extension = {
      aeria = 'aeria'
    }
})

vim.treesitter.language.add('aeria', {
    path = tsdistpath .. '/aeria.so',
    filetype = 'aeria'
})

if vim.fn.isdirectory(queriespath) == 0 then
  vim.fn.mkdir(queriespath, 'p')
end

for k, v in pairs(vim.fn.readdir(pluginqueriespath)) do
  local file = pluginqueriespath .. '/' .. v
  local bufnr = vim.fn.bufadd(file)
  vim.fn.bufload(bufnr)
  vim.api.nvim_buf_call(bufnr, function()
    vim.cmd.write({ queriespath .. '/' .. v,  bang = true })
  end)

  vim.api.nvim_buf_delete(bufnr, {})
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'aeria' },
  callback = function()
    vim.opt_local.comments = '://'
    vim.opt_local.commentstring = '// %s'
    vim.treesitter.start()
    vim.lsp.start({
      name = 'aeria-language-server',
      cmd = {
        'node',
        tsdistpath .. '/language-server.js',
        '--stdio',
      },
    })
  end,
  group = aeriaSettings
})

