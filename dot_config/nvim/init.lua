require('configs.impatient')

require('core.options')
require('core.plugins')
require('core.mappings')
require('core.ft')

local compiled_ok, _ = pcall(require, 'packer_compiled')
if compiled_ok then
  require('packer_compiled')
end
