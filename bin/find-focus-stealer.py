#!/usr/bin/python

# Ref:
#   https://apple.stackexchange.com/questions/123730/is-there-a-way-to-detect-what-program-is-stealing-focus-on-my-mac/148094#148094

from AppKit import NSWorkspace
import time
import datetime

t = range(1,100)

for i in t:
    time.sleep(3)
    activeAppName = NSWorkspace.sharedWorkspace().activeApplication()['NSApplicationName']
    print datetime.datetime.now(), activeAppName

