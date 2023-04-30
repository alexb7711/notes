all:
	emacs -Q --script publish.el

clean:
	rm -rf docs/*
