default: cogweb

cogweb: .cogweb
	(cd .cogweb; git pull)
	@echo "Now run 'source .cogweb/.rc'."

.cogweb:
	git clone -b cogweb `git config --get remote.origin.url` .cogweb
