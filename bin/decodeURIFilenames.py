#!/usr/bin/env python
import os
import urllib2

for filename in os.listdir(os.getcwd()):
    decodedName = urllib2.unquote(filename)
    if filename != decodedName:
        print decodedName
        os.rename(filename, decodedName)
