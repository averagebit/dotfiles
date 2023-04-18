return {
    default_config = {
        -- Refer to https://github.com/Microsoft/vscode-eslint#settings-options for documentation.
        settings = {
            validate = "on",
            useESLintClass = false,
            codeActionOnSave = {
                enable = false,
                mode = "all",
            },
            format = false,
            quiet = false,
            onIgnoredFiles = "off",
            rulesCustomizations = {},
            run = "onType",
            -- nodePath configures the directory in which the eslint server should start its node_modules resolution.
            -- This path is relative to the workspace folder (root dir) of the server instance.
            nodePath = "",
            -- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
            workingDirectory = { mode = "location" },
        },
    },
}
