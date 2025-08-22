return {
  name = 'gopls',
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      -- Better completion
      completeUnimported = true,
      usePlaceholders = true,
      
      -- Enhanced analysis
      analyses = {
        unusedparams = true,
        shadow = true,
        fieldalignment = true,
        nilness = true,
        unusedwrite = true,
        useany = true,
      },
      
      -- Enhanced hover information
      hoverKind = "FullDocumentation",
      linkTarget = "pkg.go.dev",
      linksInHover = true,
      
      -- Code lens
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      
      -- Inlay hints
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      
      -- Static check
      staticcheck = true,
      
      -- Semantic tokens for better syntax highlighting
      semanticTokens = true,
    },
  },
}
