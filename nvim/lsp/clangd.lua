local function nix_clangd()
  for dir in string.gmatch(vim.env.PATH or "", "[^:]+") do
    if vim.startswith(dir, "/nix/store/") then
      local path = dir .. "/clangd"
      if vim.fn.executable(path) == 1 then
        return path
      end
    end
  end
end

return {
  cmd = {
    nix_clangd() or "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--function-arg-placeholders=true",
    "--query-driver=/nix/store/*-clang-wrapper-*/bin/clang++",
  },
}
