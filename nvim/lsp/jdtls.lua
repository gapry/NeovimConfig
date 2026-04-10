local function get_java_home(cmd)
  local handle = vim.fn.system(cmd)
  return vim.trim(handle)
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
    },
  },
}
