# LaTeX Template

Template repo for LaTeX packages.

Includes tests and test frameworks for LaTeX packages and macros.

## Installation

1. `git clone https://github.com/r-spiewak/latex_template.git`

## Dev Installation

After completing the regular installation above, also do the following:
1. Install pre-commit (e.g., `apt install pre-commit`), if not already installed.

When using this template, replace all occurances of `unnamed` with the name of the new package. Specifically, the file names `unnamed.ins` and `unnamed.dtx`, as well as the in the contents of those files, in `all.ins`, in `tests.tex`, and the top of `.github/workflows/build.yml`. Also replace the top of this `README.md` file with appropriate information.

To generate releases, trigger the workflow for a tagged release with a command such as
`git tag v1.0.0` to tag a release, and then 
`git push origin v1.0.0` (to only push the tag, and not the associated commits)
or `git push --follow-tags` (to push all commits and related tags).
