return {
  before_init = function(_, config)
    if not config.root_dir then
      return
    end

    local venv_python = config.root_dir .. "/.venv/bin/python"

    if vim.uv.fs_stat(venv_python) then
      config.settings = config.settings or {}
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = venv_python
    end
  end,
}
