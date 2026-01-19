# P6's POSIX.2: p6df-github

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- `gheAbd` -> `p6df::modules::github::ext::alerts::by::dep`
- `gheAbf` -> `p6df::modules::github::ext::alerts::by::file`
- `gheAbs` -> `p6df::modules::github::ext::alerts::by::severity`
- `gheAby` -> `p6df::modules::github::ext::alerts::by::repo`
- `gheacl` -> `p6df::modules::github::ext::actions::cache::list`
- `gheal` -> `p6df::modules::github::ext::action::lint`
- `ghedr` -> `p6df::modules::github::ext::dependencies::report`
- `ghegpl` -> `p6df::modules::github::ext::gitpod::launch`
- `ghell` -> `p6df::modules::github::ext::label::list`
- `ghePc` -> `p6df::modules::github::ext::parallel::clone`
- `ghepl` -> `p6df::modules::github::ext::permissions::list`
- `gheta` -> `p6df::modules::github::ext::tidy::all`
- `ghetl` -> `p6df::modules::github::ext::topics::list`
- `ghpc` -> `p6_github_cli_pr_checkout`
- `ghpl` -> `p6_github_cli_pr_list`
- `ghplc` -> `p6df::modules::github::util::pr::last::checkout`
- `ghpMl` -> `p6_github_util_pr_merge_last`
- `ghpS` -> `p6df::modules::github::util::pr::submit`
- `ghpv` -> `p6df::modules::github::util::pr::last::view`
- `ghrb` -> `p6df::modules::github::ext::ruleset::branch`

### Functions

#### ext

##### p6df-github/lib/ext/actions.sh

- `p6df::modules::github::ext::action::lint()`
- `p6df::modules::github::ext::actions::cache::list()`

##### p6df-github/lib/ext/alerts.sh

- `p6df::modules::github::ext::alerts(org)`
- `p6df::modules::github::ext::alerts::by::dep(org)`
- `p6df::modules::github::ext::alerts::by::file(org)`
- `p6df::modules::github::ext::alerts::by::repo(org)`
- `p6df::modules::github::ext::alerts::by::severity(org)`

##### p6df-github/lib/ext/dependencies.sh

- `p6df::modules::github::ext::dependencies::report(org_repo)`

##### p6df-github/lib/ext/gitpod.sh

- `p6df::modules::github::ext::gitpod::launch()`

##### p6df-github/lib/ext/label.sh

- `p6df::modules::github::ext::label::list()`

##### p6df-github/lib/ext/parallel.sh

- `p6df::modules::github::ext::parallel::clone(org, dir)`

##### p6df-github/lib/ext/permissions.sh

- `p6df::modules::github::ext::permissions::list(org_repo)`

##### p6df-github/lib/ext/ruleset-branch.sh

- `p6df::modules::github::ext::ruleset::branch(...)`

##### p6df-github/lib/ext/tidy.sh

- `p6df::modules::github::ext::tidy::all()`

##### p6df-github/lib/ext/topics.sh

- `p6df::modules::github::ext::topics::list()`

#### p6df-github

##### p6df-github/init.zsh

- `p6df::modules::github::aliases::init()`
- `p6df::modules::github::deps()`
- `p6df::modules::github::external::brew()`
- `p6df::modules::github::external::yum()`
- `p6df::modules::github::home::symlink()`
- `p6df::modules::github::init(_module, dir)`
- `p6df::modules::github::langs()`
- `p6df::modules::github::langs::extensions()`
- `p6df::modules::github::vscodes()`
- `str str = p6df::modules::github::prompt::mod()`

#### p6df-github/lib

##### p6df-github/lib/util.sh

- `p6df::modules::github::util::org::admin::show(dir)`
- `p6df::modules::github::util::org::archive(dir)`
- `p6df::modules::github::util::org::name::sanity(dir)`
- `p6df::modules::github::util::org::ruleset::branch::default::activate(dir)`
- `p6df::modules::github::util::org::ruleset::branch::default::create(dir)`
- `p6df::modules::github::util::org::ruleset::branch::default::delete(dir)`
- `p6df::modules::github::util::org::ruleset::branch::mine(dir)`
- `p6df::modules::github::util::org::unarchive(dir, dir)`
- `p6df::modules::github::util::pr::last::checkout()`
- `p6df::modules::github::util::pr::last::view()`
- `p6df::modules::github::util::pr::submit(msg, [pr_num=], [editor=$EDITOR])`
- `p6df::modules::github::util::ruleset::branch::default::create()`
- `p6df::modules::github::util::ruleset::branch::default::delete()`
- `p6df::modules::github::util::ruleset::branch::mine()`

## Hierarchy

```text
.
├── conf
│   ├── actrc
│   └── gh
│       ├── config.yml
│       ├── hosts.yml
│       └── hosts.yml.in
├── init.zsh
├── lib
│   ├── ext
│   │   ├── actions.sh
│   │   ├── alerts.sh
│   │   ├── dependencies.sh
│   │   ├── gitpod.sh
│   │   ├── label.sh
│   │   ├── parallel.sh
│   │   ├── permissions.sh
│   │   ├── ruleset-branch.sh
│   │   ├── tidy.sh
│   │   └── topics.sh
│   └── util.sh
└── README.md

5 directories, 17 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
