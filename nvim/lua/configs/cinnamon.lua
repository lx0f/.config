local status_ok, cinnamon = pcall(require, "cinnamon")
if status_ok then
  cinnamon.setup({})
end
