import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops        (ewmh)
import System.Taffybar.Hooks.PagerHints (pagerHints)

main = do
  xmobar <- spawnPipe "~/.cabal/bin/taffybar"
  xmonad $ ewmh $ pagerHints $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , borderWidth = myBorderWidth
    , workspaces = myWorkspaces
    , focusFollowsMouse = False
    , startupHook = setWMName "LG3D"
    , modMask = mod4Mask -- Super instead of Meta key
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "dm-tool switch-to-greeter") --mod4mask is the windows key
    , ((0, xK_Print), spawn "gnome-screenshot")
    ]

myNormalBorderColor = "#586e75"
myFocusedBorderColor = "#b58900"
myBorderWidth = 2
myWorkspaces = ["editor","browser","chat","four","five"] ++ map show [6..9]
