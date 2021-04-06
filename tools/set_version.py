'''Set the version-dependent link in the project homepage.
'''
import sys

INDEX_FILE = '../docs/index.md'
PLACEHOLDER = '0.99.0'


def set_version(version):

	with open(INDEX_FILE, 'r', encoding='utf-8') as f:
		text = f.read()
		
	with open(INDEX_FILE, 'w', encoding='utf-8') as f:
		f.write(text.replace(PLACEHOLDER, version))

if __name__ == '__main__':
	version = sys.argv[1]
	set_version(version)
