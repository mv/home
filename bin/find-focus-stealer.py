#!/usr/bin/python

# Ref:
#   https://apple.stackexchange.com/questions/123730/is-there-a-way-to-detect-what-program-is-stealing-focus-on-my-mac/148094#148094

from AppKit import NSWorkspace

import datetime
import time

while True:

    activeAppName = NSWorkspace.sharedWorkspace().activeApplication()['NSApplicationName']
    timestamp = datetime.datetime.now()

    print timestamp, activeAppName
    time.sleep(3)

#

