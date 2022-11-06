local base16_project_theme = os.getenv('BASE16_THEME')

if base16_project_theme and vim.g.colors_name ~= 'base16-' .. base16_project_theme then
    vim.cmd('colorscheme base16-' .. base16_project_theme)
end
