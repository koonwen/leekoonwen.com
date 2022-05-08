
project_name = website

# The opam package configuration file
opam_file = $(project_name).opam

# Alis to update the opam file and install the needed deps
deps: $(opam_file)

run :
	dune exec $(project_name) --profile release -- --port=8000

debug :
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

# Update the package dependencies when new deps are added to dune-project
$(opam_file): dune-project
	-dune build @install        # Update the $(project_name).opam file
	-git add $(opam_file)       # opam uses the state of master for it updates
	-git commit $(opam_file) -m "Updating package dependencies"
	opam install . --deps-only  # Install the new dependencies