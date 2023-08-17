# rtl-actions

This repository contains Github actions for SoC front-end design.

Most design flows are based on Synopsys EDA tools (e.g., vcs, verdi, spyglass, design compiler). Some flows are based on open-source tools (e.g., peakRDL).

# Usage

This repository can be used as a submodule of a HW IP repository.

For more details of github submodule, refer to [Git - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

# HW IP repository

(We will refer HW_IP_REPO as an example of HW IP repositories using rtl-actions as a submodule. You can check an [example](https://github.com/scalable-arch/AIDCLite) on GitHub.

To instantiate this repository as a submodule of HW_IP_REPO, type the following command under the top directory of HW_IP_REPO

```$ git submodule add https://github.com/scalable-arch/rtl-actions```

This will create a new directory (named rtl-actions) which contains this repository and .gitmodules file.
After the creation, you need to commit the changes to your local repository and push the changes to GitHub.

```
$ git add rtl-actions .gitmodules
$ git commit -m "Added rtl-actions submodule"
$ git push
```

# Actions

```rtl-actions``` serve two use cases: GitHub Actions and Command Line Interface (CLI).

## GitHub Actions

For GitHub Actions, we provide action.yml files under some of the top-level folders (e.g., lint, rdl-html, rdl-regblock). GitHub workflows can use these top-level folder names as an action. The action.yml files define input arguments and forward the arguments from a GitHub workflow to an action script in the `bin` directory.

For example,
Under ```lint``` folder, we have the following ```action.yml```.
```
name: 'RTL:lint'

inputs:
  filelist:
    description: "The path to the filelist containing all the design file. The path is relative to the root of the repository"
    type: string
    required: false
  top:
    description: "The name of the top-level design"
    type: string
    required: false

runs:
  using: composite
  steps:
    - run: rtl-actions/bin/action.lint \
           ${{ inputs.filelist  && '--filelist inputs.filelist' || '' }} \
           ${{ inputs.top && '--top inputs.top' || '' }}
      shell: bash
```
This yaml script under lint directory, defines as GitHub action, which can be accessed by ```scalable-arch/rtl-actions/lint@main```. It also describes two optional input arguments (filelist and top), which GitHub action can provide. When invoked by GitHub Action, it executes `rtl-actions/bin/action.lint` with argument forwarding (```A && B || C``` operates as a ternary operator in yaml).

And a HW_IP_REPO can have the following workflow defined in .github/workflows/lint-spyglass.yml
```
name: Lint-Spyglass-RTL-Handoff
run-name: Spyglass Lint for an IP-level RTL handoff from ${{ github.actor }}
on:
  pull_request:
    branches:
      - main
jobs:
  Spyglass:
    runs-on: self-hosted        # runs on a server with Synopsys Spyglass installed
    steps:
      # checkout the repository (with its submodules) to the runner
      - name: Checkout code
        uses: actions/checkout@v3
        with:
          submodules: recursive
      # run lint
      - name: Spyglass-Lint
        uses: scalable-arch/rtl-actions/lint@main
  ...
```

The workflow file will run ```scalable-arch/rtl-actions/lint@main```, which is defined in the lint/action.yml of this repository, on a pull request to the main branch.


## Local Actions in CLI

Most ASIC front-end development is conducted in Linux terminals. In order to provide the same commands and results to both GitHub Actions and CLI Actions, `rtl-actions` use the same scripts under the bin directory (GitHub Actions invokes the bin/ scripts in turn).

# Setting Variables and Path

When you execute an action in a command line interface (CLI)
When you execute an action on the command line interface (CLI), the action script will first try to find ```env.source``` (a bash script file) starting from the root directory to your current working directory (e.g., /env.source, /home/env.source, /home/dale40/env.source, /home/dale40/HW_IP_REPO/env.source
When you execute an action, ir

# Register Automation using SystemRDL

Refer to [https://github.com/scalable-arch/rtl-actions/tree/main/rdl-regblock]

# RTL Design

Refer to [https://github.com/scalable-arch/rtl-actions/tree/main/sim]

# Linting RTL

Refer to [https://github.com/scalable-arch/rtl-actions/tree/main/lint]

# Synthsizing RTL

Refer to [https://github.com/scalable-arch/rtl-actions/tree/main/syn]
