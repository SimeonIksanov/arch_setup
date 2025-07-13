#!/usr/bin/env bash

# echo "w /proc/acpi/wakeup - - - - LID0" > /usr/lib/tmpfiles.d/disable-lid-wake.conf
echo "w /proc/acpi/wakeup - - - - LID0" > /etc/tmpfiles.d/disable-lid-wake.conf
