install:
	install -o root -g root -m 755 bin/* /usr/local/bin/
	install -o root -g root -m 644 bash_completion.d/* /etc/bash_completion.d/

