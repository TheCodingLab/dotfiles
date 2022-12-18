local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb',
}
