
#!/bin/sh

amixer sset Capture toggle

if amixer get Capture | grep -q "\[on\]"; then
  notify-send "🎤 Microphone" "ON"
else
  notify-send "🔇 Microphone" "OFF"
fi
