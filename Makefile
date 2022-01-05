
project_name = website

run :
	dune exec $(project_name) --profile release -- --port=8000

run-debug :
	dune exec $(project_name) -- --debug --verbose --port=8000

build :
	# dune build ./lib
	# dune build ./bin
	dune build

clean :
	dune clean
	rm -rf ./static/*.html