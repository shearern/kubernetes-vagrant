#!/usr/bin/python
import sys
from socket import gethostname

if __name__ == '__main__':
    hostname = gethostname()
    if hostname == 'master':
        print("master")
    elif hostname.startswith('node'):
        print("worker")
    else:
        print("NOT SURE")
        sys.exit(2)
