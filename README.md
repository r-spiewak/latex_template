# LaTeX Template

Template repo for LaTeX packages.

Includes tests and test frameworks for LaTeX packages and macros.

## Installation

Ensure you have a `LaTex` installation and package manager. If not, see `https://tug.org/texlive/quickinstall.html` for some instructions.

1. `git clone https://github.com/r-spiewak/latex_template.git`

## Dev Installation

After completing the regular installation above, also do the following:
1. Install pre-commit (e.g., `apt install pre-commit`), if not already installed.
2. Run `bash utils/install-packages.sh` to install dependencies (if you didn't install all available packages with `tlmgr`).
3. (Optional, but recommended:) Compile `testmacros.ins` (or `all.ins`) to produce `testmacros.sty`.

When adding packages, the script `utils/generate-packages.sh` is useful.

When using this template, replace all occurances of `unnamed` with the name of the new package. Specifically, the file names `unnamed.ins` and `unnamed.dtx`, as well as the in the contents of those files, in `all.ins`, in `tests.tex`, and the top of `.github/workflows/build.yml`. Add dependencies to the lists in `.github/workflows/main.yml` and `.github/workflows/build.yml`. Also replace the top of this `README.md` file with appropriate information.

To generate releases, trigger the workflow for a tagged release with a command such as
`git tag v1.0.0` to tag a release, and then 
`git push origin v1.0.0` (to only push the tag, and not the associated commits)
or `git push --tags` (to push all tags). *Note*: `git push` must also still be run in order to push the commits themselves. So something like `git add . && git commit -m "<Commit message>" && git tag v0.0.8 && git push && git push --tags` is necessary to push both tags and commits.
