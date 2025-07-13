return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    enabled = false,
    dependencies = {
      "tris203/rzls.nvim",
      config = true,
    },
    init = function()
      vim.filetype.add({
        extension = { razor = "razor", cshtml = "razor" },
      })
    end,
    ft = { "cs", "razor" },
    opts = {
      filewatching = "auto",
      choose_target = nil,
      ignore_target = nil,
      broad_search = true,
      lock_target = false,
      debug = false,
    },
    config = function()
      vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        pattern = "*",
        callback = function()
          local clients = vim.lsp.get_clients({ name = "roslyn" })
          if not clients or #clients == 0 then
            return
          end

          local client = assert(clients[1])
          local buffers = vim.lsp.get_buffers_by_client_id(client.id)
          for _, buf in ipairs(buffers) do
            local params = {
              textDocument = vim.lsp.util.make_text_document_params(buf),
            }
            client:request(vim.lsp.protocol.Methods.textDocument_diagnostic, params, nil, buf)
          end
        end,
      })
      local capabilities = {
        textDocument = {
          diagnostic = {
            dynamicRegistration = true,
          },
        },
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      }
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
      local rzls_path = vim.fn.expand("$MASON/packages/rzls/libexec")
      vim.lsp.config("roslyn", {
        cmd = {
          "roslyn",
          "--stdio",
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
          "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
          "--razorDesignTimePath="
            .. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
          "--extension",
          vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
        },
        -- filetypes = { "cs", "razor" },
        -- capabilities = capabilities,
        handlers = require("rzls.roslyn_handlers"),
        settings = {
          ["csharp|background_analysis"] = {
            ["background_analysis.dotnet_analyzer_diagnostics_scope"] = "fullSolution",
            ["background_analysis.dotnet_compiler_diagnostics_scope"] = "fullSolution",
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
          },
          ["csharp|completion"] = {
            dotnet_provide_regex_completions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ["csharp|symbol_search"] = {
            dotnet_search_reference_assemblies = true,
          },
          ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = true,
          },
        },
      })
    end,
  },
}
