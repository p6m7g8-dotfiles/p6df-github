# PR Workflow

Goal: every PR gets merged. Work PRs in ascending order, one at a time.

## Definition of Done

A PR is merged when GitHub's merge queue completes it.

## Checklist (per PR)

Fix whatever is broken and loop until all items are true, then queue.

1. PR exists
2. Branch exists
3. Branch/PR is current with base
4. Conflicts resolved
5. All commits signed — squash and sign if not
6. Branch ruleset matches `::branch::mine()`
7. Fix any `.yml` issues before queuing to prevent merge queue hangs
8. CI checks pass — merge queue behaves correctly, no duplicate builds
9. All review conversations resolved — replied to, agreed, improved, or rejected

When all items are true, add to the merge queue. Wait for merge. Move to the next PR.

## Failure Recovery

If anything goes wrong (crash, timeout, token limit, reboot, auth error, tool unavailable,
compaction, sub-agent failure, session resumed): spawn a new agent, resume state, and continue.

The response to every failure is: continue.

## Hard Constraints

- One PR at a time
- Never sleep more than 3 seconds
- Never remove branch protection rules
- Never trigger the merge queue or merge manually — only GitHub Actions merges
- Stream all output live and untruncated — tools, tasks, commands, scripts, and thoughts
