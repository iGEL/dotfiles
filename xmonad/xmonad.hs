import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops        (ewmh)
import XMonad.Hooks.EwmhDesktops
import System.Taffybar.Hooks.PagerHints (pagerHints)
import Graphics.X11.ExtraTypes.XF86

main = do
  _ <- spawnPipe "/usr/bin/taffybar"
  xmonad $ ewmh $ pagerHints $ def
    { manageHook = manageDocks <+> manageHook def
    , layoutHook = avoidStruts  $  layoutHook def
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , borderWidth = myBorderWidth
    , workspaces = myWorkspaces
    , focusFollowsMouse = False
    , startupHook = setWMName "LG3D"
    , modMask = mod4Mask -- Super instead of Meta key
    , handleEventHook = fullscreenEventHook
    , terminal = "x-terminal-emulator"
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "light-locker-command --lock") --mod4mask is the windows key
    , ((0, xK_Print), spawn "gnome-screenshot")
    , ((0 , xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%; paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga")
    , ((0 , xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -1.5%; paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga")
    , ((0 , xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle; paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga")
    , ((0 , 0x1008FFB2), spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
    ]

myNormalBorderColor = "#586e75"
myFocusedBorderColor = "#b58900"
myBorderWidth = 2
myWorkspaces = ["editor","terminal","browser","chat","five"] ++ map show [6..9]
