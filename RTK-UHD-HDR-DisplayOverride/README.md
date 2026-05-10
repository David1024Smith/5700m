# RTK UHD HDR Display Override

This override is built from the DP/Type-C EDID captured in `5700M-debug`.

Why this exists:

- HDMI currently reports the same monitor as `AppleDisplay-4a8b-1b1a`, but with EDID 1.3 and a zero serial field.
- DP/Type-C reports EDID 1.4 with the expected serial field and a more complete capability block.
- The override asks macOS to use the better RTK UHD HDR identity/capability data for this display ID.

Files:

- `DisplayVendorID-4a8b/DisplayProductID-1b1a`
- `macOS-install/install-rtk-display-override.command`
- `macOS-install/copy-paste-install-command.txt`

If the `.command` file will not run, open Terminal and paste the command from:

`macOS-install/copy-paste-install-command.txt`

If the folder is not at `~/Desktop/5700M/RTK-UHD-HDR-DisplayOverride`, first `cd` into this folder in Terminal, then paste:

`macOS-install/copy-paste-after-cd.txt`

Test order:

1. Boot with the current stable universal EFI.
2. Install this display override in macOS.
3. Reboot macOS.
4. Test HDMI audio.
5. Test Type-C HiDPI scaling.

If HDMI still shows the output device but remains silent after this, the next useful data is a WhateverGreen debug log for AMD connector routing.
