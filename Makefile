
project_name = website

run :
	dune exec $(project_name) --profile release -- --port=8000

run-debug :
	dune exec $(project_name) -- --debug --verbose --port=8000

build :
	dune build @install

# Remove generated htmls
clean :
	dune clean
	rm -rf ./static/*.html

# Create a switch environment with 4.13.0 compiler and install the dependencies
install :
	opam switch create ./ 4.13.0 --deps-only --with-doc --with-test

# Show missing libraries
show-ext-lib :
	dune external-lib-deps ./

