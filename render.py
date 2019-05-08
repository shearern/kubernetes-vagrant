#!/usr/bin/python
import sys, os
from socket import gethostname

from jinja2 import Environment, FileSystemLoader, select_autoescape

def get_node_type():
    hostname = gethostname()
    if hostname == 'master':
        return "master"
    elif hostname.startswith('node'):
        return "worker"
    else:
        return "NOT SURE"


if __name__ == '__main__':

	try:
		template, dest = sys.argv[1:]
	except:
		print("USAGE: redner.py template dst")
		sys.exit(1)

 	j2_env = Environment(loader=FileSystemLoader(os.path.dirname(os.path.abspath(__file__))),
                         trim_blocks=True)

 	template = j2_env.get_template(template)

 	with open(dest, 'wt') as fh:
 		fh.write(template.render(
 			hostname = gethostname(),
 			node_type = get_node_type(),
 			))
