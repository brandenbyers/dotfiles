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

--
-- Turn off Animations.
--
hs.window.animationDuration = 0


