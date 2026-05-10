# Next Debug Commands

Only use these if the display override does not fix HDMI audio.

Temporary OpenCore boot-args for one debug boot:

```text
-wegdbg -liludbg msgbuf=1048576 keepsyms=1 debug=0x100
```

After booting macOS with HDMI connected, run:

```bash
mkdir -p ~/Desktop/5700M-hdmi-debug

log show --last boot \
  --predicate 'process == "kernel" AND (eventMessage CONTAINS "WhateverGreen" OR eventMessage CONTAINS "Lilu" OR eventMessage CONTAINS "Radeon" OR eventMessage CONTAINS "AppleGFXHDA")' \
  --style syslog --source > ~/Desktop/5700M-hdmi-debug/weg-hdmi.log

ioreg -lw0 > ~/Desktop/5700M-hdmi-debug/ioreg-hdmi.txt
system_profiler SPDisplaysDataType SPAudioDataType > ~/Desktop/5700M-hdmi-debug/system-hdmi.txt
```

Then reboot back with the normal daily boot-args.
