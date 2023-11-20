vim.cmd([[ autocmd FileType scss setl iskeyword+=@-@ ]])
vim.cmd([[autocmd BufRead,BufEnter *.astro set filetype=astro]])
vim.cmd([[autocmd BufRead,BufNewFile .babelrc,.eslintrc,.stylelintrc set filetype=json]])
vim.cmd([[autocmd BufRead,BufNewFile .sequelizerc set filetype=javascript]])
vim.cmd([[ au TextYankPost * silent! lua vim.highlight.on_yank{timeout=100} ]])
vim.cmd([[
	inoremap <expr> <CR> InsertMapForEnter()
	function! InsertMapForEnter()
			if pumvisible()
					return "\<C-y>"
			elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
					return "\<CR>\<Esc>O"
			elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
					return "\<CR>\<Esc>O"
			elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == ']'
					return "\<CR>\<Esc>O"
			elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == ')'
					return "\<CR>\<Esc>O"
			else
					return "\<CR>"
			endif
	endfunction
]])

-- vim.cmd([[ autocmd RecordingEnter * set cmdheight=1 ]])
-- vim.cmd([[ autocmd RecordingLeave * set cmdheight=0 ]])

-- if vim.fn.has("wsl") == 1 then
--     if vim.fn.executable("wl-copy") == 0 then
--         print("wl-clipboard not found, clipboard integration won't work")
--     else
--         vim.g.clipboard = {
--             name = "wl-clipboard (wsl)",
--             copy = {
--                 ["+"] = 'wl-copy --foreground --type text/plain',
--                 ["*"] = 'wl-copy --foreground --primary --type text/plain',
--             },
--             paste = {
--                 ["+"] = (function()
--                     return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', {''}, 1) -- '1' keeps empty lines
--                 end),
--                 ["*"] = (function()
--                     return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', {''}, 1)
--                 end),
--             },
--             cache_enabled = true
--         }
--     end
-- end

-- In_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
--
-- if In_wsl then
--     vim.g.clipboard = {
--         name = 'wsl clipboard',
--         copy =  { ["+"] = { "/mnt/c/Windows/System32/clip.exe" },   ["*"] = { "/mnt/c/Windows/System32/clip.exe" } },
--         paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
--         cache_enabled = true
--     }
-- end
