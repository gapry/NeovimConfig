local function get_java_home(cmd)
  local lines = vim.fn.systemlist(cmd)
  for i = #lines, 1, -1 do
    local line = vim.trim(lines[i])
    if line ~= "" then
      return line
    end
  end
  return ""
end

return {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = get_java_home("cs java-home --jvm temurin:1.25.0.2"),
            default = true,
          },
        },
      },
      project = {
        referencedLibraries = {
          vim.fn.expand("~/lib/java/lift/stdlib.jar"),
          vim.fn.expand("~/lib/java/lift/introcs.jar"),
          vim.fn.expand("~/lib/java/lift/algs4.jar"),
        },
      },
    },
  },
}
