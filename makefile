# Ensure PyMind is installed
ifeq (, $(shell which pymind))
	$(error "No pymind in $(PATH), consider doing apt-get install pymind")
endif

# Execute PyMind
all:
	pymind -f -c "./config/pymind.toml"
