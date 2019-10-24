# Thesis template

This is the template used for my PhD thesis.
Let others benefit from my endless hours of procrastination :)

## Compiling

The easiest way to generate a PDF is `make pdf`.
Over the years, LaTeX gave me frequent headaches when packages changed
and my documents did no longer compiler. Here comes nix (https://nixos.org/nix)
for the rescue! It is a great tool for reproducible builds.
Once installed, you can simply type `nix-build` and find the output in
`result/thesis.pdf` afterwards. Since all packages are pinned, the build
should never ever break :)

## Linting

Hey, we are living in the 21st century and there are so many fancy tools
for making sure the quality of your writing is superb. Offload as much as
possible from your proof readers so that they can focus on the actual contents!

I really enjoyed using the awesome vale plugin (https://github.com/dense-analysis/ale)
in vim to correct many errors while typing. But sometimes, I overlooked the
editor's hints and therefore added manual linter steps as explained below.

### Spell checker
You can use `make aspell` to start the spell checker interactively.
See http://aspell.net/ for usage details.

### Vale
The project is ready to be used with vale (https://errata-ai.github.io/vale/) -
a prose linter. It can be invoked via `nix-build nix/release.nix -A lint.vale`.

## TODO

This template is a stripped down version of my thesis. Feel free to help me
out improving it. This is list of things I plan to do next.

* [ ]  add tikz examples
* [ ]  remove unused LaTeX packages
* [ ]  resolve warnings listed in logs
* [ ]  add another title page for the hand in version, not only the final one
* [ ]  mark required customizations with `XXX` and provide instructions
* [ ]  add demo chapter
* [ ]  integrate redpen via nix (it is in the makefile, but i can not test it right now)
* [ ]  make a version for master/bachelor theses (once i find my old template)
