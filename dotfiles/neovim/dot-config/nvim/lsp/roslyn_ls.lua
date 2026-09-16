return {
  cmd = {
    -- "dotnet",
    "roslyn-language-server",
    "--stdio",
    "--autoLoadProjects"
  },
  root_markers = { ".sln", ".slx", ".git" },
  filetypes = { "cs", "razor" }
}
