hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- local function keyCode(key)
--   return function() hs.eventtap.keyStroke({}, key) end
-- end
--
-- hs.hotkey.bind({"shift", "ctrl"}, 'h', keyCode('left') ,  nil,   keyCode('left'))
-- hs.hotkey.bind({"shift", "ctrl"}, 'j', keyCode('down') ,  nil,   keyCode('down') )
-- hs.hotkey.bind({"shift", "ctrl"}, 'k', keyCode('up')   ,  nil,   keyCode('up') )
-- hs.hotkey.bind({"shift", "ctrl"}, 'l', keyCode('right'),  nil,   keyCode('right') )
--
--

-- hattip https://github.com/lodestone/hyper-hacks
-- hattip https://gist.github.com/ttscoff/cce98a711b5476166792d5e6f1ac5907

-- -- A global variable for the sub-key Hyper Mode
-- k = hs.hotkey.modal.new({}, 'F18')

-- -- Hyper+key for all the below are setup somewhere
-- -- The handler already exists, usually in Keyboard Maestro
-- -- we just have to get the right keystroke sent
-- hyperBindings = {'c','m','a','r','d','g','s','f','TAB','v','b'}

-- for i,key in ipairs(hyperBindings) do
--   k:bind({}, key, nil, function() hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
--     k.triggered = true
--   end)
-- end

-- -- Enter Hyper Mode when F19 (left control) is pressed
-- pressedF19 = function()
--   k.triggered = false
--   k:enter()
-- end

-- -- Leave Hyper Mode when F19 (left control) is pressed,
-- --   send ESCAPE if no other keys are pressed.
-- releasedF19 = function()
--   k:exit()
--   if not k.triggered then
--     hs.eventtap.keyStroke({}, 'ESCAPE')
--   end
-- end

-- -- Bind the Hyper key
-- f19 = hs.hotkey.bind({}, 'F19', pressedF19, releasedF19)

-- -- vi cursor movement commands
-- movements = {
--  { 'h', {}, 'LEFT'},
--  { 'j', {}, 'DOWN'},
--  { 'k', {}, 'UP'},
--  { 'l', {}, 'RIGHT'},
--  { '0', {'cmd'}, 'LEFT'},  -- beginning of line
--  { '4', {'cmd'}, 'RIGHT'}, -- end of line
--  { 'b', {'alt'}, 'LEFT'},  -- back word
--  { 'w', {'alt'}, 'RIGHT'}, -- forward word
-- }
-- for i,bnd in ipairs(movements) do
--   hs.hotkey.bind({'ctrl'}, bnd[1], function()
--     hs.eventtap.keyStroke(bnd[2],bnd[3])
--   end)
-- end

-- -- Reload config when any lua file in config directory changes
-- function reloadConfig(files)
--     doReload = false
--     for _,file in pairs(files) do
--         if file:sub(-4) == '.lua' then
--             doReload = true
--         end
--     end
--     if doReload then
--         hs.reload()
--     end
-- end
-- local myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
-- hs.alert.show('Config loaded') 

--
-- Window resizers
--
-- hs.hotkey.bind(k, "Left", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind(k, "Right", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w / 2)
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind(hyper,"Up", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x
--   f.y = max.y
--   f.w = max.w / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind(hyper,"Down", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w / 3 * 2)
--   f.y = max.y
--   f.w = max.w / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

--
-- Workspaces
--
-- hs.hotkey.bind(hyper,"F1", function()
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

-- hs.hotkey.bind(hyper,"F2", function()
--   local iMac = "iMac"
--   local windowLayout = {
--       {"Google Chrome", nil, iMac, hs.layout.left50,  nil, nil},
--       {"iTerm", nil, iMac, hs.layout.right50, nil, nil},
--       {"Messages", nil, iMac, hs.layout.left30, nil, nil},
--       {"Tweetbot", nil, iMac, hs.layout.left30, nil, nil},
--       {"Gitter", nil, iMac, hs.layout.left30, nil, nil},
--       {"nvALT", nil, iMac, hs.layout.right25, nil, nil},
--   }
--   hs.layout.apply(windowLayout)
-- end)

-- hs.hotkey.bind(hyper,"F3", function()
--   local macbook = "Color LCD"
--   local windowLayout = {
--       {"Vivaldi", nil, macbook, hs.layout.left60,  nil, nil},
--       {"iTerm", nil, macbook, hs.layout.right35, nil, nil},
--       {"Messages", nil, macbook, hs.layout.right40, nil, nil},
--       {"Tweetbot", nil, macbook, hs.layout.right40, nil, nil},
--       {"Gitter", nil, macbook, hs.layout.right40, nil, nil},
--       {"nvALT", nil, macbook, hs.layout.right40, nil, nil},
--   }
--   hs.layout.apply(windowLayout)
-- end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "P", function()
  local macbook = "Color LCD"
  local thunderbolt = "Thunderbolt Display"
  local thunderboltMain = hs.screen.allScreens()[0]
  local thunderboltRight = hs.screen.allScreens()[3]
  if (hs.screen.allScreens()[1]:name() == thunderbolt) then
    print(thunderboltMain)
    local windowLayout = {
        {"Firefox", nil, thunderboltRight, hs.layout.left50,  nil, nil},
        {"Safari", nil, thunderboltRight, hs.layout.left50,  nil, nil},
        {"Google Chrome", nil, thunderboltRight, hs.layout.left50,  nil, nil},
        {"iTunes", nil, thunderboltRight, hs.layout.left50,  nil, nil},
        {"AutoCAD 2017", nil, thunderboltMain, hs.layout.maximized,  nil, nil},
        {"iTerm", nil, thunderboltMain, hs.layout.maximized, nil, nil},
        {"Xcode", nil, thunderboltMain, hs.layout.maximized,  nil, nil},
        {"Sublime Text", nil, thunderboltMain, hs.layout.right50,  nil, nil},
        {"Reminders", nil, thunderboltRight, hs.layout.right30,  nil, nil},
        {"Calendar", nil, thunderboltRight, hs.layout.right50,  nil, nil},
        {"Discord", nil, macbook, hs.layout.right50,  nil, nil},
        {"PureCloud", nil, macbook, hs.layout.right50,  nil, nil},
        {"Mail", nil, macbook, hs.layout.left50,  nil, nil},
        {"Slack", nil, macbook, hs.layout.left50,  nil, nil},
        {"Gitter", nil, macbook, hs.layout.left50,  nil, nil},
        {"Messages", nil, macbook, hs.layout.right30, nil, nil},
        {"Tweetbot", nil, macbook, hs.layout.right30, nil, nil},
        {"nvALT", nil, thunderboltRight, hs.layout.left30, nil, nil},
        {"pwSafe", nil, macbook, hs.layout.left50, nil, nil},
        {"Skim", nil, thunderboltRight, hs.layout.right50, nil, nil},
        {"Preview", nil, thunderboltRight, hs.layout.right50, nil, nil},
    }
    hs.layout.apply(windowLayout)
  else
    print(macbook)
    local windowLayout = {
        {"Firefox", nil, macbook, hs.layout.left50,  nil, nil},
        {"Safari", nil, macbook, hs.layout.left50,  nil, nil},
        {"Google Chrome", nil, macbook, hs.layout.left50,  nil, nil},
        {"iTunes", nil, macbook, hs.layout.left50,  nil, nil},
        {"AutoCAD 2017", nil, macbook, hs.layout.maximized,  nil, nil},
        {"iTerm", nil, macbook, hs.layout.maximized, nil, nil},
        {"Xcode", nil, macbook, hs.layout.maximized,  nil, nil},
        {"Sublime Text", nil, macbook, hs.layout.right50,  nil, nil},
        {"Reminders", nil, macbook, hs.layout.right30,  nil, nil},
        {"Calendar", nil, macbook, hs.layout.right50,  nil, nil},
        {"Discord", nil, macbook, hs.layout.right50,  nil, nil},
        {"PureCloud", nil, macbook, hs.layout.right50,  nil, nil},
        {"Mail", nil, macbook, hs.layout.left50,  nil, nil},
        {"Slack", nil, macbook, hs.layout.left50,  nil, nil},
        {"Gitter", nil, macbook, hs.layout.left50,  nil, nil},
        {"Messages", nil, macbook, hs.layout.right30, nil, nil},
        {"Tweetbot", nil, macbook, hs.layout.right30, nil, nil},
        {"nvALT", nil, macbook, hs.layout.left30, nil, nil},
        {"pwSafe", nil, macbook, hs.layout.left30, nil, nil},
        {"Skim", nil, macbook, hs.layout.right50, nil, nil},
        {"Preview", nil, macbook, hs.layout.right50, nil, nil},
    }
    hs.layout.apply(windowLayout)
  end
end)

-- --
-- -- Turn off Animations.
-- --
-- hs.window.animationDuration = 0

-- -- Inspired by https://github.com/jasoncodes/dotfiles/blob/master/hammerspoon/control_escape.lua
-- -- You'll also have to install Karabiner Elements and map caps_lock to left_control there
-- len = function(t)
--     local length = 0
--     for k, v in pairs(t) do
--     	length = length + 1
--     end
--     return length
-- end


-- send_escape = false
-- prev_modifiers = {}

-- modifier_handler = function(evt)
--     -- evt:getFlags() holds the modifiers that are currently held down
--     local curr_modifiers = evt:getFlags()

--     if curr_modifiers["ctrl"] and len(curr_modifiers) == 1 and len(prev_modifiers) == 0 then
--         -- We need this here because we might have had additional modifiers, which
--         -- we don't want to lead to an escape, e.g. [Ctrl + Cmd] —> [Ctrl] —> [ ]
--         send_escape = true
--     elseif prev_modifiers["ctrl"]  and len(curr_modifiers) == 0 and send_escape then
-- 		send_escape = false
--         hs.eventtap.keyStroke({}, "ESCAPE")
--     else
--         send_escape = false
-- 	end
--     prev_modifiers = curr_modifiers
-- 	return false
-- end


-- -- Call the modifier_handler function anytime a modifier key is pressed or released
-- modifier_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, modifier_handler)
-- modifier_tap:start()


-- -- If any non-modifier key is pressed, we know we won't be sending an escape
-- non_modifier_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
--     send_escape = false
-- 	return false
-- end)
-- non_modifier_tap:start()
