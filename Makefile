start: 
	dune exec -- ./src/main.exe

.PHONY :build
build: 
	dune build

.PHONY :w-build
w-build: 
	dune build -w --terminal-persistence=clear-on-rebuild

tailwind:
	# Only works with macos
	curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
	chmod +x tailwindcss-macos-arm64
	mv tailwindcss-macos-arm64 tailwindcss

init: tailwind
	echo "Done"

