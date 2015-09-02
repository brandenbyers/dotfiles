--
-- Window resizers
--
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"},"Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"},"Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 3 * 2)
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

--
-- Workspaces
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"},"F1", function()
--   local macbook = "Color LCD"
--   local thunderbolt = "Thunderbolt Display"
--   local windowLayout = {
--       {"Google Chrome", nil, thunderbolt, hs.layout.left50,  nil, nil},
--       {"iTerm", nil, thunderbolt, hs.layout.right50, nil, nil},
--       {"Messages", nil, thunderbolt, hs.layout.left30, nil, nil},
--       {"Tweetbot", nil, thunderbolt, hs.layout.left30, nil, nil},
--       {"Gitter", nil, thunderbolt, hs.layout.left30, nil, nil},
--       {"nvALT", nil, thunderbolt, hs.layout.right25, nil, nil},
--       {"PureCloud", nil, macbook, hs.layout.right50, nil, nil},
--       {"Microsoft Outlook", nil, macbook, hs.layout.left50, nil, nil},
--   }
--   hs.layout.apply(windowLayout)
-- end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"},"F2", function()
  local iMac = "iMac"
  local windowLayout = {
      {"Google Chrome", nil, iMac, hs.layout.left50,  nil, nil},
      {"iTerm", nil, iMac, hs.layout.right50, nil, nil},
      {"Messages", nil, iMac, hs.layout.left30, nil, nil},
      {"Tweetbot", nil, iMac, hs.layout.left30, nil, nil},
      {"Gitter", nil, iMac, hs.layout.left30, nil, nil},
      {"nvALT", nil, iMac, hs.layout.right25, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"},"F3", function()
  local macbook = "Color LCD"
  local windowLayout = {
      {"Google Chrome", nil, macbook, hs.layout.left70,  nil, nil},
      {"iTerm", nil, macbook, hs.layout.right30, nil, nil},
      {"Messages", nil, macbook, hs.layout.right30, nil, nil},
      {"Tweetbot", nil, macbook, hs.layout.right30, nil, nil},
      {"Gitter", nil, macbook, hs.layout.right30, nil, nil},
      {"nvALT", nil, macbook, hs.layout.right30, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "F1", function()
  local macbook = "Color LCD"
  local iMac = "iMac"
  local thunderbolt = "Thunderbold Display"
  if (hs.screen.allScreens()[1]:name() == macbook) then
    if (hs.screen.allScreens()[2]) then
      if (hs.screen.allScreens()[2]:name() == thunderbolt) then
        -- dual display for work
        local windowLayout = {
            {"Google Chrome", nil, thunderbolt, hs.layout.left50,  nil, nil},
            {"iTerm", nil, thunderbolt, hs.layout.right50, nil, nil},
            {"Messages", nil, macbook, hs.layout.right30, nil, nil},
            {"Tweetbot", nil, macbook, hs.layout.right30, nil, nil},
            {"Gitter", nil, macbook, hs.layout.right30, nil, nil},
            {"nvALT", nil, macbook, hs.layout.right30, nil, nil},
        }
        hs.layout.apply(windowLayout)
      elseif (hs.screen.allScreens()[2]:name() == iMac) then
        -- dual display for home
        local windowLayout = {
            {"Google Chrome", nil, iMac, hs.layout.left50,  nil, nil},
            {"iTerm", nil, iMac, hs.layout.right50, nil, nil},
            {"Messages", nil, macbook, hs.layout.right30, nil, nil},
            {"Tweetbot", nil, macbook, hs.layout.right30, nil, nil},
            {"Gitter", nil, macbook, hs.layout.right30, nil, nil},
            {"nvALT", nil, macbook, hs.layout.right30, nil, nil},
        }
        hs.layout.apply(windowLayout)
      end
    else
      -- macbook screen only, WORK
      local windowLayout = {
          {"Google Chrome", nil, macbook, hs.layout.left70,  nil, nil},
          {"iTerm", nil, macbook, hs.layout.right30, nil, nil},
          {"Messages", nil, macbook, hs.layout.right30, nil, nil},
          {"Tweetbot", nil, macbook, hs.layout.right30, nil, nil},
          {"Gitter", nil, macbook, hs.layout.right30, nil, nil},
          {"nvALT", nil, macbook, hs.layout.right30, nil, nil},
      }
      hs.layout.apply(windowLayout)
    end
  elseif (hs.screen.allScreens()[1]:name() == thunderbolt) then
    -- thunderbolt screen only
    local windowLayout = {
        {"Google Chrome", nil, thunderbolt, hs.layout.left50,  nil, nil},
        {"iTerm", nil, thunderbolt, hs.layout.right50, nil, nil},
        {"Messages", nil, thunderbolt, hs.layout.left25, nil, nil},
        {"Tweetbot", nil, thunderbolt, hs.layout.left25, nil, nil},
        {"Gitter", nil, thunderbolt, hs.layout.left25, nil, nil},
        {"nvALT", nil, thunderbolt, hs.layout.left25, nil, nil},
    }
    hs.layout.apply(windowLayout)
  elseif (hs.screen.allScreens()[1]:name() == iMac) then
    -- iMac screen only, HOME
    local windowLayout = {
        {"Google Chrome", nil, iMac, hs.layout.left50,  nil, nil},
        {"iTerm", nil, iMac, hs.layout.right50, nil, nil},
        {"Messages", nil, iMac, hs.layout.left25, nil, nil},
        {"Tweetbot", nil, iMac, hs.layout.left25, nil, nil},
        {"Gitter", nil, iMac, hs.layout.left25, nil, nil},
        {"nvALT", nil, iMac, hs.layout.left25, nil, nil},
    }
    hs.layout.apply(windowLayout)
  end
end)

--
-- Turn off Animations.
--
hs.window.animationDuration = 0


