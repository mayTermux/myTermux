local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {" "} -- keeping this table { } as empty will show inactive statuslines

local colors = {
    bg = "#1e222a",
    line_bg = "#1e222a",
    fg = "#D8DEE9",
    fg_green = "#65a380",
    yellow = "#A3BE8C",
    cyan = "#22262C",
    darkblue = "#61afef",
    green = "#BBE67E",
    orange = "#FF8800",
    purple = "#252930",
    magenta = "#c678dd",
    blue = "#22262C",
    -- red = "#DF8890",
    -- red = "#FA5AA4",
    red = "#FA74B2",
    red2 = "#e06c75",
    lightbg = "#282c34",
    nord = "#81A1C1",
    greenYel = "#EBCB8B"
}

gls.left[1] = {
    leftRounded = {
        provider = function()
            return ""
        end,
        highlight = {colors.fg, colors.bg}
    }
}

gls.left[2] = {
    statusOs = {
        provider = function()
            return "  Android "
        end,
        highlight = {colors.bg, colors.fg},
        --separator = " ",
        seperator_highlight = {colors.nord, colors.bg},
    }
}

--gls.left[3] = {
--    statusUser = {
--        provider = function()
--            return "   xShin "
--        end,
--        highlight = {colors.bg, colors.fg},
--        seperator = " ",
--        seperator_highlight = {colors.bg, colors.bg}
--    }
--}

gls.left[3] = {
    left_rightRounded = {
        provider = function()
            return ""
        end,
        highlight = {colors.fg, colors.bg},
        seperator = "  ",
    }
}

gls.left[4] = {
    leftRoundedFile = {
        provider = function()
            return ""
        end,
        highlight = {colors.line_bg, colors.bg}
    }
}

gls.left[5] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
    }
}

gls.left[6] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.line_bg}
    }
}

gls.left[7] = {
    teech = {
        provider = function()
            return ""
        end,
        separator = " ",
        highlight = {colors.line_bg, colors.line_bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.left[8] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.greenYel, colors.line_bg}
    }
}

gls.left[9] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.orange, colors.line_bg}
    }
}

gls.left[10] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.red, colors.line_bg}
    }
}

gls.left[11] = {
    LeftEnd = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = {colors.line_bg, colors.line_bg},
        highlight = {colors.line_bg, colors.line_bg}
    }
}

gls.left[12] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.bg}
    }
}

gls.left[13] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {colors.line_bg, colors.line_bg}
    }
}

gls.left[14] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            -- return "   "
            return "   GitBranch "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.fg, colors.line_bg}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.line_bg}
    }
}

gls.right[3] = {
    right_LeftRounded = {
        provider = function()
            return ""
        end,
        separator = " ",
        separator_highlight = {colors.bg, colors.bg},
        -- highlight = {colors.red, colors.bg}
        highlight = {colors.nord, colors.bg}
    }
}

gls.right[4] = {
    ViMode = {
        provider = function()
            local alias = {
                n = " NORMAL",
                i = " INSERT",
                c = "COMMAND",
                V = "VISUAL",
                [""] = "VISUAL",
                v = "VISUAL",
                R = "REPLACE"
            }
            return alias[vim.fn.mode()]
        end,
        highlight = {colors.bg, colors.nord}
    }
}

gls.right[5] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = {colors.nord, colors.nord},
        highlight = {colors.bg, colors.fg}
    }
}

gls.right[6] = {
    rightRounded = {
        provider = function()
            return ""
        end,
        highlight = {colors.fg, colors.bg}
    }
}
