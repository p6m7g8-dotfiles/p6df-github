# P6's POSIX.2: p6df-github

## Table of Contents

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

## Contributing

- [How to Contribute](<https://github.com//.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com//.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- gheAbd IS p6df::modules::github::ext::alerts::by::dep
- gheAbf IS p6df::modules::github::ext::alerts::by::file
- gheAbs IS p6df::modules::github::ext::alerts::by::severity
- gheAby IS p6df::modules::github::ext::alerts::by::repo
- gheacl IS p6df::modules::github::ext::actions::cache::list
- gheal IS p6df::modules::github::ext::action::lint
- ghedr IS p6df::modules::github::ext::dependencies::report
- ghegpl IS p6df::modules::github::ext::gitpod::launch
- ghell IS p6df::modules::github::ext::label::list
- ghePc IS p6df::modules::github::ext::parallel::clone
- ghepl IS p6df::modules::github::ext::permissions::list
- gheta IS p6df::modules::github::ext::tidy::all
- ghetl IS p6df::modules::github::ext::topics::list
- ghpc IS p6_github_cli_pr_checkout
- ghpl IS p6_github_cli_pr_list
- ghplc IS p6df::modules::github::util::pr::last::checkout
- ghpMl IS p6_github_util_pr_merge_last
- ghpS IS p6df::modules::github::util::pr::submit
- ghpv IS p6df::modules::github::util::pr::last::view
- ghrb IS p6df::modules::github::ext::ruleset::branch
### Functions

## ext

### p6df-github/lib/ext/actions.sh

- p6df::modules::github::ext::action::lint()
- p6df::modules::github::ext::actions::cache::list()

### p6df-github/lib/ext/alerts.sh

- p6df::modules::github::ext::alerts(org)
- p6df::modules::github::ext::alerts::by::dep(org)
- p6df::modules::github::ext::alerts::by::file(org)
- p6df::modules::github::ext::alerts::by::repo(org)
- p6df::modules::github::ext::alerts::by::severity(org)

### p6df-github/lib/ext/dependencies.sh

- p6df::modules::github::ext::dependencies::report(org_repo)

### p6df-github/lib/ext/gitpod.sh

- p6df::modules::github::ext::gitpod::launch()

### p6df-github/lib/ext/label.sh

- p6df::modules::github::ext::label::list()

### p6df-github/lib/ext/parallel.sh

- p6df::modules::github::ext::parallel::clone(org, dir)

### p6df-github/lib/ext/permissions.sh

- p6df::modules::github::ext::permissions::list(org_repo)

### p6df-github/lib/ext/ruleset-branch.sh

- p6df::modules::github::ext::ruleset::branch(...)

### p6df-github/lib/ext/tidy.sh

- p6df::modules::github::ext::tidy::all()

### p6df-github/lib/ext/topics.sh

- p6df::modules::github::ext::topics::list()

## p6df-github

### p6df-github/init.zsh

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

## p6df-github/lib

### p6df-github/lib/util.sh

- p6df::modules::github::util::org::admin::show(dir)
- p6df::modules::github::util::org::archive(dir)
- p6df::modules::github::util::org::name::sanity(dir)
- p6df::modules::github::util::org::ruleset::branch::default::activate(dir)
- p6df::modules::github::util::org::ruleset::branch::default::create(dir)
- p6df::modules::github::util::org::ruleset::branch::default::delete(dir)
- p6df::modules::github::util::org::ruleset::branch::mine(dir)
- p6df::modules::github::util::org::unarchive(dir)
- p6df::modules::github::util::org::workflow::upgrade-main::run(dir)
- p6df::modules::github::util::pr::last::checkout()
- p6df::modules::github::util::pr::last::view()
- p6df::modules::github::util::pr::submit(msg, [pr_num=], [editor=$EDITOR])
- p6df::modules::github::util::ruleset::branch::default::create()
- p6df::modules::github::util::ruleset::branch::default::delete()
- p6df::modules::github::util::ruleset::branch::mine()

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

Philip M . Gollucci <pgollucci@p6m7g8.com>
