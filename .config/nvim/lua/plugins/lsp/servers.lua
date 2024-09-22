local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- Python
nvim_lsp.pylsp.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    maxLineLength = 88, -- Make flake8 compatible with black
                },
            },
        },
    },
}
-- GoLang
nvim_lsp.gopls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- JavaScript and Typescript
nvim_lsp.ts_ls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    -- commands = {
    --     TSServerOrganizeImports = {
    --         function()
    --             local params = {
    --                 command = "_typescript.organizeImports",
    --                 arguments = { vim.api.nvim_buf_get_name(0) },
    --             }
    --             vim.lsp.buf.execute_command(params)
    --         end,
    --         description = "Organize Imports",
    --     },
    -- },
}
nvim_lsp.eslint.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- C and Arduino
nvim_lsp.ccls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    filetypes = { "c", "cpp", "objc", "objcpp", "ino" }
}
-- Gleam
nvim_lsp.gleam.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- XML
nvim_lsp.lemminx.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- GLSL
nvim_lsp.glsl_analyzer.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- Java
nvim_lsp.jdtls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- YAML
nvim_lsp.yamlls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- Helm
nvim_lsp.helm_ls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        ['helm-ls'] = {
            yamlls = {
                enabled = true,
                diagnosticsLimit = 50,
                showDiagnosticsDirectly = false,
                path = "yaml-language-server",
                config = {
                    schemas = {
                        ["http://127.0.0.1:8000/all.json"] = "templates/**",
                        -- ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json"] = "templates/**",
                    },
                    completion = true,
                    hover = true,
                }
            },
        },
    },
}
-- Svelte
nvim_lsp.svelte.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- Lua
nvim_lsp.lua_ls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
nvim_lsp.jsonls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
nvim_lsp.gdscript.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
-- PHP
nvim_lsp.intelephense.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        intelephense = {
            stubs = {
                'Core',
                'Ev',
                'FFI',
                'LuaSandbox',
                'PDO',
                'Parle',
                'Phar',
                'Reflection',
                'SPL',
                'SQLite',
                'SaxonC',
                'SimpleXML',
                'SplType',
                'Zend OPcache',
                'ZendCache',
                'ZendDebugger',
                'ZendUtils',
                'aerospike',
                'amqp',
                'apache',
                'apcu',
                'ast',
                'bcmath',
                'blackfire',
                'bz2',
                'calendar',
                'cassandra',
                'com_dotnet',
                'couchbase',
                'couchbase_v3',
                'crypto',
                'ctype',
                'cubrid',
                'curl',
                'date',
                'dba',
                'decimal',
                'dio',
                'dom',
                'ds',
                'enchant',
                'event',
                'exif',
                'fann',
                'ffmpeg',
                'fileinfo',
                'filter',
                'fpm',
                'ftp',
                'gd',
                'gearman',
                'geoip',
                'geos',
                'gettext',
                'gmagick',
                'gmp',
                'gnupg',
                'grpc',
                'hash',
                'http',
                'ibm_db2',
                'iconv',
                'igbinary',
                'imagick',
                'imap',
                'inotify',
                'interbase',
                'intl',
                'json',
                'judy',
                'ldap',
                'leveldb',
                'libevent',
                'libsodium',
                'libvirt-php',
                'libxml',
                'lua',
                'lzf',
                'mailparse',
                'mapscript',
                'mbstring',
                'mcrypt',
                'memcache',
                'memcached',
                'meminfo',
                'meta',
                'ming',
                'mongo',
                'mongodb',
                'mosquitto-php',
                'mqseries',
                'msgpack',
                'mssql',
                'mysql',
                'mysql_xdevapi',
                'mysqli',
                'ncurses',
                'newrelic',
                'oauth',
                'oci8',
                'odbc',
                'openssl',
                'parallel',
                'pcntl',
                'pcov',
                'pcre',
                'pdflib',
                'pdo_ibm',
                'pdo_mysql',
                'pdo_pgsql',
                'pdo_sqlite',
                'pgsql',
                'phpdbg',
                'posix',
                'pspell',
                'pthreads',
                'radius',
                'rar',
                'rdkafka',
                'readline',
                'recode',
                'redis',
                'regex',
                'rpminfo',
                'rrd',
                'session',
                'shmop',
                'snmp',
                'soap',
                'sockets',
                'sodium',
                'solr',
                'sqlite3',
                'sqlsrv',
                'ssh2',
                'standard',
                'stats',
                'stomp',
                'suhosin',
                'superglobals',
                'svm',
                'svn',
                'sybase',
                'sync',
                'sysvmsg',
                'sysvsem',
                'sysvshm',
                'tidy',
                'tokenizer',
                'uopz',
                'uuid',
                'uv',
                'v8js',
                'wddx',
                'win32service',
                'winbinder',
                'wincache',
                'wordpress',
                'xcache',
                'xdebug',
                'xhprof',
                'xlswriter',
                'xml',
                'xmlreader',
                'xmlrpc',
                'xmlwriter',
                'xsl',
                'xxtea',
                'yaf',
                'yaml',
                'yar',
                'zend',
                'zip',
                'zlib',
                'zmq',
                'zookeeper',
                'zstd'
            }
        },
    }
}
