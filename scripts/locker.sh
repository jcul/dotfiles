#!/bin/sh

exec xautolock -time 3 -locker "i3lock -d -c 000000" \
    -notify 30 \
    -notifier "notify-send -u critical -t 5000 -- 'LOCKING screen in 30 seconds'"
