# rtl-actions

This repository contains Github actions used by Scalable Architecture Lab at Sungkyunkwan University.

# Usage

This repository can be used as a submodule of a HW IP repository.

For more details of github submodule, refer to [Git - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

# HW IP repository

(We will refer HW_IP_REPO as an example of HW IP repositories using rtl-actions.)

To instantiate this repository as a submodule of HW_IP_REPO, type the following command under the top directory of HW_IP_REPO

```$ git submodule add https://github.com/scalable-arch/rtl-actions```

This will create a new directory, named rtl-actions, which contains this repository.
After the creation, you need to commit the folder (and .gitmodules) and push the changes to GitHub.

# Setting Variables and Path

