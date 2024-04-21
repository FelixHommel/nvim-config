require("telescope").setup({
    defaults = {
        path_dsiaply = {
            shorten = {
                len = 3,
                exclude = {1, -1}
            },
            truncate = true
        },
        dynamic_preview_title = true,
    },

    pickers = {
        buffers = {
            theme = "dropdown",
            previewer = true,
        },

        find_files = {
            theme = "dropdown"
        },
    },

    exensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart-case"
        },

        ["ui-select"] = {
            require("telescope.themes").get_cursor {

            },
        },
    }
})

require("telescope-tabs").setup({
    entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
		local entry_string = table.concat(vim.tbl_map(function(v)
			return vim.fn.fnamemodify(v, ":.")
		end, file_paths), ', ')
		return string.format('%d: %s%s', tab_id, entry_string, is_current and ' <' or '')
	end,

    entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths, is_current)
        return table.concat(file_names, ' ')
    end,
})

require("telescope").load_extension("ui-select")
