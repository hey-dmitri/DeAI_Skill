# critic-agent (DeAI Skill)

A self-review protocol that catches AI tells, voice mismatches, and substance problems in written work, then revises until the text passes or three rounds run out.

Point it at any draft (an email, a post, outreach copy, a report) and it runs four checks: whether the voice matches your samples, whether the substance holds up, structural AI fingerprints, and formatting tells. It flags each issue against a named rule, suggests what you'd actually write instead of just deleting, and stops after three rounds.

## What's in here

| File | Role |
|------|------|
| `SKILL.md` | The skill, and the single source of truth. The full protocol and the banned-phrase list live here. |
| `critic-agent.skill` | A zip of `SKILL.md` for one-step install. Generated from `SKILL.md`, never edited by hand. |
| `build.sh` | Rebuilds `critic-agent.skill` from `SKILL.md`. |
| `LICENSE` | CC0. |

## The banned-phrase list

The list is tiered so the critic reacts proportionally instead of flagging every draft:

- Tier 1 is a hard kill: words that give AI away on sight, like "delve," "tapestry," or "load-bearing." One hit flags.
- Tier 2 flags in clusters: words that are fine alone but suspicious in bulk, like "crucial," "showcasing," or "quietly." Three or more in one piece flags.
- Tier 3 is tone leakage: chatbot phrasing that slipped into the output, like "I hope this helps" or "in conclusion." One hit flags.

The full list lives in `SKILL.md`. Add your own there.

## Install

Skills are filesystem-based, so you drop the folder where Claude looks and it loads automatically. Unzip the bundle into your skills directory:

```bash
unzip critic-agent.skill -d ~/.claude/skills/     # personal, every project
# or
unzip critic-agent.skill -d .claude/skills/       # this project only
```

That gives you `~/.claude/skills/critic-agent/SKILL.md`. Start Claude Code and say "run the critic" or "check this for AI tells."

## Editing

`SKILL.md` is the only file you edit. After changing it, rebuild the bundle so the two stay in step:

```bash
./build.sh
```

Then commit both files.

## License

CC0-1.0. No rights reserved.
