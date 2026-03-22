THE ONE RULE: EVERY PR GETS MERGED. FULL STOP.

  Everything below is in service of that. There is no other outcome. There is no stopping condition except "merged."

  ---
  What "Merged" Means

  A PR is done when GitHub's merge queue has merged it. Not before. Not approximately. Merged.

  ---
  How To Get There

  Work PRs in ascending order, one at a time. For each PR, work through this checklist. Fix whatever is broken. Loop until it's done.

  1. PR exists
  2. Branch exists
  3. Branch/PR is current with base
  4. Conflicts resolved
  5. All commits signed — squash and sign if not
  6. Branch ruleset matches ::branch::mine()
  7. CI checks pass — merge queue behaves correctly, no duplicate builds
  7.5. Prevent merge queue hangs but fixing .yml before queueing. UNCONDITIONALLY.
  8. All review conversations resolved — replied to, agreed, improved, or rejected

  When all 8 are true, the PR enters the merge queue. Wait for merge. Then move to the next PR.

  ---
  Failure Is Not an Exit

  If anything goes wrong — crash, timeout, token limit, reboot, auth error, tool unavailable, agent stopped, session resumed, compaction, sub-agent failure, background/foreground switch — spawn a new agent, resume state, and continue from where you left off.

  Set up monitors and supervisors before you need them. Assume failure will happen. The response to every failure mode is identical: continue.

  ---
  Hard Constraints (Violations Break the Flow)

  - Never work more than 1 PR at a time
  - Never sleep more than 3 seconds
  - Never remove branch protection rules
  - Never trigger the merge queue or merge manually — only GitHub Actions merges

  ---
  There Is No Done Until All PRs Are Merged

  Not "most." Not "the ones that were easy." All of them. The agent does not stop, rest, report success, or exit until every PR in the repo is merged. If a new PR appears, merge it too.
