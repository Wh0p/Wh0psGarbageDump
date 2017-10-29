local awful         = require("awful")
local mod           = require("keys.modkeys")



-- view tag with name
local function goto_tag_name(s)
  if not s or #s == 0 then return end
  local t = awful.tag.find_by_name(awful.screen.focused(), s)
  if t then
    t:view_only()
  end
end

local function goto_tag_name_prompt()
    awful.prompt.run {
        prompt       = "Goto tag: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = goto_tag_name
    }
end



-- view tag with name and move focused window
local function moveto_tag_name(s)
  local c = client.focus
  if not c then return end
  if not s or #s == 0 then return end

  local t = awful.tag.find_by_name(awful.screen.focused(), s)
  if t then
    c:tags({t})
    t:view_only()
  end
end

local function moveto_tag_name_prompt()
    awful.prompt.run {
        prompt       = "Moveto tag: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = moveto_tag_name
    }
end



-- view tag at relative index d
local function goto_tag(d)
  while d > 0 do
    awful.tag.viewnext()
    d = d - 1
  end
  while d < 0 do
    awful.tag.viewprev()
    d = d + 1
  end
end

-- view tag at relative index d and move focused window
local function moveto_tag(d)
  local c = client.focus
  if not c then return end

  goto_tag(d)

  local t = awful.screen.focused().selected_tag
  if t then
    c:tags({t})
    t:view_only()
  end
end


return awful.util.table.join(
  -- browsing (4x3 grid: up, down, left, right)
  awful.key({ mod.super, mod.alt    }, "h", function() goto_tag(-4) end,
            {description = "view previous", group = "tag"}),
  awful.key({ mod.super, mod.alt    }, "l", function() goto_tag(4) end,
            {description = "view previous", group = "tag"}),
  awful.key({ mod.super,           }, "h",   awful.tag.viewprev,
            {description = "view previous", group = "tag"}),
  awful.key({ mod.super,           }, "l",  awful.tag.viewnext,
            {description = "view next", group = "tag"}),
  -- move window
  awful.key({ mod.super, mod.alt, mod.ctrl}, "h", function() moveto_tag(-4) end,
            {description = "view previous", group = "tag"}),
  awful.key({ mod.super, mod.alt, mod.ctrl}, "l", function() moveto_tag(4) end,
            {description = "view previous", group = "tag"}),
  awful.key({ mod.super,         mod.ctrl}, "h", function() moveto_tag(-1) end,
            {description = "view previous", group = "tag"}),
  awful.key({ mod.super,         mod.ctrl}, "l", function() moveto_tag(1) end,
            {description = "view next", group = "tag"}),



  -- goto tag
  awful.key({ mod.super,           }, "g",  goto_tag_name_prompt,
            {description = "goto tag by name", group = "tag"}),
  -- move window
  awful.key({ mod.super,         mod.ctrl }, "g",  moveto_tag_name_prompt,
            {description = "moveto tag by name", group = "tag"}),



  -- goto special tag
  awful.key({ mod.super,           }, "b",  function() goto_tag_name("browse") end,
            {description = "goto tag 'browse'", group = "tag"}),
  awful.key({ mod.super,           }, "m",  function() goto_tag_name("mail") end,
            {description = "goto tag 'mail'", group = "tag"}),
  awful.key({ mod.super,           }, "w",  function() goto_tag_name("music") end,
            {description = "goto tag 'music'", group = "tag"}),
  awful.key({ mod.super,           }, "v",  function() goto_tag_name("x") end,
            {description = "goto tag 'x'", group = "tag"}),
  awful.key({ mod.super, mod.alt    }, "b",  function() goto_tag_name("dr") end,
            {description = "goto tag 'dr' (dev ranger)", group = "tag"}),
  awful.key({ mod.super, mod.alt    }, "m",  function() goto_tag_name("de") end,
            {description = "goto tag 'de' (dev edit)", group = "tag"}),
  awful.key({ mod.super, mod.alt    }, "w",  function() goto_tag_name("dm") end,
            {description = "goto tag 'dm' (dev make)", group = "tag"}),
  awful.key({ mod.super, mod.alt    }, "v",  function() goto_tag_name("dg") end,
            {description = "goto tag 'dg' (dev git)", group = "tag"}),
  -- move window
  awful.key({ mod.super,         mod.ctrl }, "b",  function() moveto_tag_name("browse") end,
            {description = "moveto tag 'browse'", group = "tag"}),
  awful.key({ mod.super,         mod.ctrl }, "m",  function() moveto_tag_name("mail") end,
            {description = "moveto tag 'mail'", group = "tag"}),
  awful.key({ mod.super,         mod.ctrl }, "w",  function() moveto_tag_name("music") end,
            {description = "moveto tag 'music'", group = "tag"}),
  awful.key({ mod.super,         mod.ctrl }, "v",  function() moveto_tag_name("x") end,
            {description = "moveto tag 'x'", group = "tag"}),
  awful.key({ mod.super, mod.alt, mod.ctrl }, "b",  function() moveto_tag_name("dr") end,
            {description = "moveto tag 'dr' (dev ranger)", group = "tag"}),
  awful.key({ mod.super, mod.alt, mod.ctrl }, "m",  function() moveto_tag_name("de") end,
            {description = "moveto tag 'de' (dev edit)", group = "tag"}),
  awful.key({ mod.super, mod.alt, mod.ctrl }, "w",  function() moveto_tag_name("dm") end,
            {description = "moveto tag 'dm' (dev make)", group = "tag"}),
  awful.key({ mod.super, mod.alt, mod.ctrl }, "v",  function() moveto_tag_name("dg") end,
            {description = "moveto tag 'dg' (dev git)", group = "tag"})
)

