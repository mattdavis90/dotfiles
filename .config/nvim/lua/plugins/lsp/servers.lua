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

nvim_lsp.eslint.setup {}
nvim_lsp.gdscript.setup {}
nvim_lsp.gleam.setup {}
nvim_lsp.glsl_analyzer.setup {}
nvim_lsp.gopls.setup {}
nvim_lsp.html.setup {}
nvim_lsp.jdtls.setup {}
nvim_lsp.jsonls.setup {}
nvim_lsp.lemminx.setup {}
nvim_lsp.svelte.setup {}
nvim_lsp.yamlls.setup {}
nvim_lsp.vala_ls.setup{}

nvim_lsp.ccls.setup {
    filetypes = { "c", "cpp", "objc", "objcpp", "ino" }
}
nvim_lsp.ts_ls.setup {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}
nvim_lsp.pylsp.setup {
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
nvim_lsp.helm_ls.setup {
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
                    },
                    completion = true,
                    hover = true,
                }
            },
        },
    },
}
nvim_lsp.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
nvim_lsp.intelephense.setup {
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
