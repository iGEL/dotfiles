import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.UrgencyHook

main = do
  xmobar <- spawnPipe "xmobar"
  xmonad $ withUrgencyHook NoUrgencyHook defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , logHook = dynamicLogWithPP $ xmobarPP {ppCurrent = xmobarColor "#b58900" "" . wrap "[" "]", ppUrgent = xmobarColor "#dc322f" "#002b36" . xmobarStrip, ppOutput = hPutStrLn xmobar , ppTitle = xmobarColor "#859900" "" . shorten 70}
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , borderWidth = myBorderWidth
    , workspaces = myWorkspaces
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock") --mod4mask is the windows key
    , ((0, xK_Print), spawn "gnome-screenshot")
    ]

myNormalBorderColor = "#586e75"
myFocusedBorderColor = "#b58900"
myBorderWidth = 2
xmobarCurrentWorkspaceColor = "#b58900"
myWorkspaces = ["editor","browser","chat","four","five"] ++ map show [6..9]
