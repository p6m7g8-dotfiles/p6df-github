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

p6df module for GitHub: gh CLI aliases, PR workflows, profile switching,
and MCP server setup (`github-mcp-server`) with `GITHUB_PERSONAL_ACCESS_TOKEN` management.

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
- `gheasw` -> `p6df::modules::github::ext::actions::status::watch`
- `ghecbd` -> `p6df::modules::github::ext::clean::branches::dry`
- `ghegpl` -> `p6df::modules::github::ext::gitpod::launch`
- `ghetktl` -> `p6df::modules::github::ext::team::list`
- `ghetktm` -> `p6df::modules::github::ext::team::members`
- `ghplc` -> `p6df::modules::github::util::pr::last::checkout`
- `ghpMl` -> `p6_github_util_pr_merge_last`
- `ghpMo` -> `p6_github_util_pr_merge_oldest`

### Functions

#### ext

##### p6df-github/lib/ext/actions-status.sh

- `p6df::modules::github::ext::actions::status()`
  - Synopsis: Shows status of GitHub Actions workflows in the current repository
- `p6df::modules::github::ext::actions::status::watch()`
  - Synopsis: Watches GitHub Actions workflow status with live updates

##### p6df-github/lib/ext/actions.sh

- `p6df::modules::github::ext::action::lint()`
  - Synopsis: Runs actionlint to validate GitHub Actions workflow files with color output
- `p6df::modules::github::ext::actions::cache::list()`
  - Synopsis: Lists GitHub Actions cache entries (limit 100)

##### p6df-github/lib/ext/alerts.sh

- `p6df::modules::github::ext::alerts(org)`
  - Synopsis: Lists all security alerts for an organization
  - Args:
    - org - organization name
- `p6df::modules::github::ext::alerts::by::dep(org)`
  - Synopsis: Aggregates security alerts by dependency and sorts by count
  - Args:
    - org - organization name
- `p6df::modules::github::ext::alerts::by::file(org)`
  - Synopsis: Aggregates security alerts by affected file and sorts by count
  - Args:
    - org - organization name
- `p6df::modules::github::ext::alerts::by::repo(org)`
  - Synopsis: Aggregates security alerts by repository and sorts by count
  - Args:
    - org - organization name
- `p6df::modules::github::ext::alerts::by::severity(org)`
  - Synopsis: Aggregates security alerts by severity level and sorts by count
  - Args:
    - org - organization name

##### p6df-github/lib/ext/clean-branches.sh

- `p6df::modules::github::ext::clean::branches()`
  - Synopsis: Deletes local branches that have been merged or deleted on remote
- `p6df::modules::github::ext::clean::branches::dry()`
  - Synopsis: Shows which local branches would be deleted (dry run)

##### p6df-github/lib/ext/dependencies.sh

- `p6df::modules::github::ext::dependencies::report(org_repo)`
  - Synopsis: Generates a dependency report for a repository
  - Args:
    - org_repo - organization/repository name

##### p6df-github/lib/ext/environments.sh

- `p6df::modules::github::ext::environments::create(name)`
  - Synopsis: Creates a new environment in the current repository
  - Args:
    - name - environment name
- `p6df::modules::github::ext::environments::delete(name)`
  - Synopsis: Deletes an environment from the current repository
  - Args:
    - name - environment name
- `p6df::modules::github::ext::environments::list()`
  - Synopsis: Lists all environments for the current repository

##### p6df-github/lib/ext/gitpod.sh

- `p6df::modules::github::ext::gitpod::launch()`
  - Synopsis: Launches a Gitpod workspace for the current repository

##### p6df-github/lib/ext/label.sh

- `p6df::modules::github::ext::label::list()`
  - Synopsis: Lists all labels in the current repository

##### p6df-github/lib/ext/parallel.sh

- `p6df::modules::github::ext::parallel::clone(org, dir)`
  - Synopsis: Clones all repositories from an organization in parallel to a directory
  - Args:
    - org - organization name
    - dir - target directory

##### p6df-github/lib/ext/permissions.sh

- `p6df::modules::github::ext::permissions::list(org_repo)`
  - Synopsis: Lists collaborators and their permissions for a repository
  - Args:
    - org_repo - organization/repository name

##### p6df-github/lib/ext/ruleset-branch.sh

- `p6df::modules::github::ext::ruleset::branch(...)`
  - Synopsis: Pass-through wrapper to gh ruleset-branch extension with all arguments
  - Args:
    - ...

##### p6df-github/lib/ext/team-kit.sh

- `p6df::modules::github::ext::team::list(org)`
  - Synopsis: Lists all teams in an organization
  - Args:
    - org - organization name
- `p6df::modules::github::ext::team::members(org, team)`
  - Synopsis: Lists members of a team in an organization
  - Args:
    - org - organization name
    - team - team name

##### p6df-github/lib/ext/tidy.sh

- `p6df::modules::github::ext::tidy::all()`
  - Synopsis: Tidies up branches by rebasing all branches on the trunk branch

##### p6df-github/lib/ext/topics.sh

- `p6df::modules::github::ext::topics::list()`
  - Synopsis: Lists all topics for the current repository

#### p6df-github

##### p6df-github/init.zsh

- `p6df::modules::github::aliases::init()`
- `p6df::modules::github::deps()`
- `p6df::modules::github::external::brew()`
- `p6df::modules::github::external::yum()`
- `p6df::modules::github::home::symlink()`
- `p6df::modules::github::init(_module, dir)`
  - Args:
    - _module
    - dir
- `p6df::modules::github::langs()`
- `p6df::modules::github::langs::extensions()`
- `p6df::modules::github::mcp()`
- `p6df::modules::github::mcp::env()`
- `p6df::modules::github::profile::off()`
- `p6df::modules::github::profile::on(profile, my_user, my_token)`
  - Args:
    - profile
    - my_user
    - my_token
- `p6df::modules::github::vscodes()`
- `p6df::modules::github::vscodes::config()`
- `str str = p6df::modules::github::prompt::mod()`

#### p6df-github/lib

##### p6df-github/lib/org.sh

- `p6df::modules::github::org::admin::show(dir)`
  - Synopsis: Shows admin status for all repositories in an organization directory (checkout, pull, status, diff, PRs)
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::archive(dir)`
  - Synopsis: Archives all repositories in an organization directory
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::name::sanity(dir)`
  - Synopsis: Internal helper that performs git checkout, pull, status, diff, and lists PRs Strips leading underscores f
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::ruleset::branch::default::activate(dir)`
  - Synopsis: Activates the default branch ruleset for all repositories in an organization directory
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::ruleset::branch::default::create(dir)`
  - Synopsis: Creates the default branch ruleset for all repositories in an organization directory
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::ruleset::branch::default::delete(dir)`
  - Synopsis: Deletes the default branch ruleset for all repositories in an organization directory
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::ruleset::branch::mine(dir)`
  - Synopsis: Applies custom branch ruleset configuration to all repositories in an organization directory
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::unarchive(dir)`
  - Synopsis: Unarchives all repositories in an organization directory
  - Args:
    - dir - dir MUST also be the org name
- `p6df::modules::github::org::visibility(dir, visibility)`
  - Args:
    - dir - dir MUST also be the org name
    - visibility
- `p6df::modules::github::org::workflow::upgrade_main::run(dir)`
  - Synopsis: Runs the upgrade-main workflow on all repositories in an organization directory
  - Args:
    - dir - dir MUST also be the org name

#### util

##### p6df-github/lib/util/pr.sh

- `p6df::modules::github::util::pr::last::checkout()`
  - Synopsis: Checks out the branch for the last pull request
- `p6df::modules::github::util::pr::last::view()`
  - Synopsis: Opens the last pull request in the web browser
- `p6df::modules::github::util::pr::submit(msg, [pr_num=], [editor=$EDITOR])`
  - Synopsis: Submits a pull request with the specified message using configured defaults
  - Args:
    - msg - commit message
    - OPTIONAL pr_num - pull request number []
    - OPTIONAL editor - editor to use [$EDITOR]

##### p6df-github/lib/util/ruleset_branch.sh

- `p6df::modules::github::util::ruleset::branch::default::create()`
  - Synopsis: Creates the default branch ruleset for the current repository
- `p6df::modules::github::util::ruleset::branch::default::delete()`
  - Synopsis: Deletes the default branch ruleset for the current repository
- `p6df::modules::github::util::ruleset::branch::mine()`
  - Synopsis: Applies custom branch ruleset configuration with merge queue, PR requirements, and Copilot code review

## Hierarchy

```text
.
├── conf
│   ├── actrc
│   └── gh
│       ├── config.yml
│       └── hosts.yml.in
├── init.zsh
├── lib
│   ├── ext
│   │   ├── actions-status.sh
│   │   ├── actions.sh
│   │   ├── alerts.sh
│   │   ├── clean-branches.sh
│   │   ├── dependencies.sh
│   │   ├── environments.sh
│   │   ├── gitpod.sh
│   │   ├── label.sh
│   │   ├── parallel.sh
│   │   ├── permissions.sh
│   │   ├── ruleset-branch.sh
│   │   ├── team-kit.sh
│   │   ├── tidy.sh
│   │   └── topics.sh
│   ├── org.sh
│   └── util
│       ├── pr.sh
│       └── ruleset_branch.sh
└── README.md

6 directories, 22 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
