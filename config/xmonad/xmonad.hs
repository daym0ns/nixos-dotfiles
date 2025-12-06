import Xmonad
import Xmonad.Util.EZConfig (additionalKeysP)
import Xmonad.Layout.Spacing

myLayoutHook = spacingWithEdge 3 $ layoutHook def

myKeys = 
  [ ("M-S-r", spawn "xmonad --recompile" >> spawn "xmonad --restart")
  , ("M-<Return>", spawn "alacritty")
  , ("M-q", kill)
  , ("M-r", spawn "rofi -show drun")
  ]

main = xmonad $ def
  { modMask = mod4Mask
  , borderWidth = 3
  , terminal = "alacritty"
  , normalBorderColor = "#444b6a"
  , focusedBorderColor = "#ad8ee6"
  , layoutHook = myLayoutHook
  }
  `additionalKeysP` myKeys
