# p6df-github

## Table of Contents


### p6df-github
- [p6df-github](#p6df-github)
  - [Badges](#badges)
  - [Distributions](#distributions)
  - [Summary](#summary)
  - [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
  - [Usage](#usage)
  - [Author](#author)

### Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/p6m7g8/p6df-github)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges/p6m7g8/p6df-github/&style=flat)](https://mergify.io)
[![codecov](https://codecov.io/gh/p6m7g8/p6df-github/branch/master/graph/badge.svg?token=14Yj1fZbew)](https://codecov.io/gh/p6m7g8/p6df-github)
[![Gihub repo dependents](https://badgen.net/github/dependents-repo/p6m7g8/p6df-github)](https://github.com/p6m7g8/p6df-github/network/dependents?dependent_type=REPOSITORY)
[![Gihub package dependents](https://badgen.net/github/dependents-pkg/p6m7g8/p6df-github)](https://github.com/p6m7g8/p6df-github/network/dependents?dependent_type=PACKAGE)

## Summary

## Contributing

- [How to Contribute](CONTRIBUTING.md)

## Code of Conduct

- [Code of Conduct](https://github.com/p6m7g8/.github/blob/master/CODE_OF_CONDUCT.md)

## Usage


### Aliases

- gheAbd -> p6df::modules::github::ext::alerts::by::dep
- gheAbf -> p6df::modules::github::ext::alerts::by::file
- gheAbs -> p6df::modules::github::ext::alerts::by::severity
- gheAby -> p6df::modules::github::ext::alerts::by::repo
- ghePc -> p6df::modules::github::ext::parallel::clone
- gheacl -> p6df::modules::github::ext::actions::cache::list
- gheal -> p6df::modules::github::ext::action::lint
- ghedr -> p6df::modules::github::ext::dependences::report
- ghegpl -> p6df::modules::github::ext::gitpod::launch
- ghell -> p6df::modules::github::ext::label::list
- ghepl -> p6df::modules::github::ext::permissions::list
- gheta -> p6df::modules::github::ext::tidy::all
- ghetl -> p6df::modules::github::ext::topics::list
- ghpMl -> p6_github_util_pr_merge_last
- ghpS -> p6df::modules::github::util::pr::submit

### Functions

### p6df-github:

#### p6df-github/init.zsh:

- p6df::modules::github::aliases::init()
- p6df::modules::github::deps()
- p6df::modules::github::external::brew()
- p6df::modules::github::external::yum()
- p6df::modules::github::home::symlink()
- p6df::modules::github::init(_module, dir)
- p6df::modules::github::langs()
- p6df::modules::github::langs::extensions()
- p6df::modules::github::vscodes()
- str str = p6df::modules::github::prompt::line()


### ext:

#### ext/actions.sh:

- p6df::modules::github::ext::action::lint()
- p6df::modules::github::ext::actions::cache::list()

#### ext/alerts.sh:

- p6df::modules::github::ext::alerts(org)
- p6df::modules::github::ext::alerts::by::dep(org)
- p6df::modules::github::ext::alerts::by::file(org)
- p6df::modules::github::ext::alerts::by::repo(org)
- p6df::modules::github::ext::alerts::by::severity(org)

#### ext/dependencies.sh:

- p6df::modules::github::ext::dependences::report(org_repo)

#### ext/gitpod.sh:

- p6df::modules::github::ext::gitpod::launch()

#### ext/label.sh:

- p6df::modules::github::ext::label::list()

#### ext/parallel.sh:

- p6df::modules::github::ext::parallel::clone(org)

#### ext/permissions.sh:

- p6df::modules::github::ext::permissions::list(org_repo)

#### ext/tidy.sh:

- p6df::modules::github::ext::tidy::all()

#### ext/topics.sh:

- p6df::modules::github::ext::topics::list()


### p6df-github/lib:

#### p6df-github/lib/util.sh:

- p6df::modules::github::util::pr::submit(msg, [pr_num=], [editor=$EDITOR])



## Hier
```text
.
├── ext
│   ├── actions.sh
│   ├── alerts.sh
│   ├── dependencies.sh
│   ├── gitpod.sh
│   ├── label.sh
│   ├── parallel.sh
│   ├── permissions.sh
│   ├── tidy.sh
│   └── topics.sh
└── util.sh

2 directories, 10 files
```
## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
