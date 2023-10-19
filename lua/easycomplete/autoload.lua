local Util = require "easycomplete.util"
local console = Util.console
local log = Util.log
local AutoLoad = {}
local get_configuration = Util.get_configuration
local show_success_message = Util.show_success_message
local curr_lsp_constructor_calling = Util.curr_lsp_constructor_calling

-- DIR/Gemfile 的引用位置对了，但lsp不生效
-- AutoLoad.rb = {
--   setup = function(self)
--     local configuration = get_configuration()
--     local gemfile = vim.fn.join({
--       configuration.nvim_lsp_root,
--       "gems/solargraph-0.44.3/Gemfile"
--     }, "/")
--     local solargraph_path = vim.fn.join({
--       configuration.nvim_lsp_root,
--       "bin",
--       "solargraph"
--     }, "/")
--     -- BUNDLE_GEMFILE=$DIR/Gemfile bundle exec ruby $DIR/bin/solargraph $*
--     Util.create_command(configuration.easy_cmd_full_path, {
--       "#!/usr/bin/env sh",
--       vim.fn.join({"BUNDLE_GEMFILE=" .. gemfile,
--         "bundle",
--         "exec",
--         "ruby",
--         solargraph_path,
--         "$*"
--       }, " ")
--     })
--     curr_lsp_constructor_calling()
--     show_success_message()
--   end
-- }

-- JSON: nvim-lsp-installer 只支持 vscode-langservers-extracted, 不支持 json-languageserver
-- AutoLoad.json = {
--    setup = function(self)
--    end
-- }

function AutoLoad.get(plugin_name)
  return Util.get(AutoLoad, plugin_name)
end

return AutoLoad
