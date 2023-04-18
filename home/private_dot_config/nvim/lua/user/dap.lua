local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
    return
end

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
    return
end

local dap_install_ok, dap_install = pcall(require, "dap-install")
if not dap_install_ok then
    return
end

dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

dap_install.config("go", {})
dap_install.config("chrome", {})

dapui.setup({
    layouts = {
        {
            elements = {
                "scopes",
                "breakpoints",
                -- "stacks",
                -- "watches",
            },
            size = 40,
            position = "right",
        },
        {
            elements = {
                -- "repl",
                -- "console",
            },
            size = 10,
            position = "bottom",
        },
    },
})

vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
