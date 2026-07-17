---
name: critic-agent
description: >
  A self-review protocol that catches AI tells, voice mismatches, and substance problems in any
  written output. Use this skill whenever the user says "run the deAI," "run the critic," "review
  this for AI tells," "check my voice," "does this sound like me," or asks to clean up, humanize,
  or de-AI any text. Also trigger when the user asks you to write in their voice and wants quality
  assurance, or when they reference voice-dna.md, banned phrases, or AI detection. This skill
  applies to any written deliverable — emails, blog posts, outreach copy, social posts, reports,
  landing pages, newsletters, pitch decks with text, or any prose the user wants to sound
  authentically human.
---

# Critic Agent

A review protocol that pressure-tests written output for voice fidelity, substance, AI
fingerprints, and formatting tells — then revises until the text passes or 3 rounds elapse.

## Dependencies

This skill requires a **voice-dna.md** file in the user's context folder (or uploaded to the
conversation). The voice-dna.md should contain:

- Writing samples that represent the user's real voice
- Preferred sentence lengths, rhythms, and formality level
- Words and phrases the user actually uses
- Any additional banned phrases beyond the built-in list below

If no voice-dna.md is available, tell the user you need it before running the full protocol.
You can still run the AI-tell and substance checks without it — just skip the voice-match
pass and be transparent about the limitation.

---

## The Review Loop

Run this process on whatever output is being reviewed. The output might be something you
just wrote, something the user pasted in, or a file the user uploaded.

### Step 1: Load context

Read **voice-dna.md** and any other context files the user has provided (style guides, brand
docs, previous feedback). These are your reference standard — every judgment you make
should trace back to something concrete in these files, not general writing advice.

### Step 2: Run the four checks

Work through each of these in order. Be specific: cite paragraph numbers, quote the
offending text, and name which check caught the issue.

#### Check 1 — Voice Match

Compare the output against the writing samples in voice-dna.md:

- **Rhythm and sentence length.** Does the cadence match? If their samples average 12–18
  words per sentence and the output averages 28, that's a flag.
- **Formality level.** If their samples are conversational and the output reads like a white
  paper, flag it.
- **Banned phrases.** Scan the full Banned Phrase List (below) and anything marked as banned
  in voice-dna.md. Any Tier 1 hit = automatic flag. Three or more Tier 2 hits in one piece
  = flag. Any Tier 3 hit = flag.
- **Vocabulary.** Does the output use words the user actually uses? Or has it drifted into
  thesaurus territory?
- **Recognition test.** Would someone who knows this person recognize their voice in this
  text?

#### Check 2 — Substance

- Does the output actually answer what was asked, or something adjacent?
- Are claims specific and grounded, or vague hand-waving?
- Is anything padded — the same point restated in different words to look thorough?
- **Regression-to-mean detection:** Does the output start specific and get progressively
  vaguer and more congratulatory as it goes? This is the most common AI failure mode.
  Specific facts dissolve into generic positive sentiment. Watch for it, especially in
  the second half of any piece.

#### Check 3 — AI Tell Detection

These are structural fingerprints that scream "AI-generated" even when the voice and
substance are fine. Scan for each of these patterns:

| Pattern | What to look for |
|---|---|
| **Significance inflation** | Puffing importance: "marking a pivotal moment," "setting the stage for," "reflects broader trends." Trailing -ing phrases that bolt on fake analysis: "...highlighting its enduring legacy." |
| **Challenge/future formula** | "Despite its [positives], [subject] faces challenges..." then "Despite these challenges, [subject] continues to..." Rewrite from scratch if present. |
| **Rule-of-three abuse** | AI loves triplets: "innovation, collaboration, and excellence." One or two per piece is fine. When every sentence has three parallel items, it's a pattern. |
| **Copulative avoidance** | "Is" becomes "serves as." "Has" becomes "features" or "boasts." If the text is allergic to simple verbs, flag it. |
| **Negative parallelism** | "Not just X, but also Y." Once is fine. A pattern of them is a tell. |
| **Elegant variation** | Cycling through synonyms: a company is "the firm," "the organization," "the enterprise," and "the tech giant" within four sentences. Just use the name. |
| **False ranges** | "From X to Y" where X and Y aren't actual endpoints of a scale. "From community engagement to technological innovation" isn't a range — it's two unrelated nouns. |
| **Vague attribution** | "Experts argue," "Industry reports suggest" — with no specific expert or report named. |
| **Press-release tone** | "Commitment to excellence," "fostering community development," "aligning with strategic goals." If it sounds like a quarterly earnings call, it doesn't belong. |

#### Check 4 — Formatting Tells

Visual and structural patterns:

- **Em dash overuse** — one or two is fine. Five or more, especially if they feel punchy in
  a sales-copy way, is a tell.
- **Title Case In Every Heading** — AI default behavior.
- **Excessive boldface** — mechanical "key takeaways" bolding pattern.
- **Inline-header lists** — bullets formatted as "**Bold header:** description text." AI's
  favorite list structure.
- **Emoji in headers or bullets** — unless voice-dna.md explicitly uses emoji, flag it.

### Step 3: Rate the output

Assign one of three ratings:

- **Excellent** — would send/publish/present without editing. Done.
- **Good** — close, but specific things need fixing. List them.
- **Needs Work** — significant issues across multiple checks. List them all.

### Step 4: Revise if needed

If below Excellent:

1. Provide specific, actionable feedback. Not "the tone is off" — instead: "Paragraph 3
   uses 'Furthermore' (Tier 2 banned word), and sentence length averages 30+ words vs.
   your usual 12–18 from the samples."
2. When flagging a banned phrase, suggest what the user would *actually* say based on
   their voice samples. Don't just delete — replace.
3. Revise the output incorporating all feedback.
4. Run the four checks again on the revised version.

### Step 5: Repeat or stop

- Repeat until Excellent, or until **3 review rounds** complete — whichever comes first.
- If 3 rounds pass without reaching Excellent, present the best version with a summary of
  remaining issues and let the user decide.

**Watch for over-correction.** Stripping every em dash, every triplet, every "crucial" can
make text robotic in a different way. The goal is text that sounds human, not text that's
been through a metal detector. Natural voice includes imperfections, casual language, and
hedging — that's a feature.

---

## Environment Adaptation

**Claude Code (sub-agents available):** Spawn a separate Critic sub-agent to do the review.
This is better because the Critic didn't write the output, so it reviews with fresh eyes.
The Critic reads voice-dna.md and runs all four checks independently.

**Claude.ai (no sub-agents):** Run the review yourself. Be honest and rigorous — the fact
that you wrote the text doesn't mean you should go easy on it. Approach the review as if
you're reading someone else's work. The user is counting on you to catch problems, not
rubber-stamp your own writing.

---

## Banned Phrase List

The Critic must check for ALL of these. Any occurrence = automatic flag.

### Tier 1: Hard Kill

Remove or rewrite immediately. These are the most recognizable AI tells.

delve, delves, delving · tapestry (figurative) · landscape (figurative) · testament (to) ·
pivotal · underscore (as verb) · intricate, intricacies · meticulous, meticulously · vibrant ·
nestled · in the heart of · groundbreaking (figurative) · indelible mark · set the stage for ·
a testament to · load-bearing (figurative)

### Tier 2: Flag and Evaluate

Not always bad, but suspicious in clusters. Three or more in one piece = AI pattern.

Additionally (sentence-start) · crucial · bolstered · garner · enduring · fostering ·
showcasing · enhance, enhancing · align with · highlight (as verb) · encompassing · profound ·
renowned · diverse array · commitment to · serves as, stands as · marks, represents (a) ·
boasts, features, offers (a) · Not just X but also Y · Despite its... faces challenges ·
from [X] to [Y] (figurative) · quietly, silently (figurative)

### Tier 3: Tone Leakage

These indicate chatbot communication was pasted or leaked into the output.

In this section we will discuss · I hope this helps · Would you like me to · It's important
to note · It's worth noting · Based on available information · maintains a low profile · keeps
personal details private · In summary · In conclusion · Overall (as wrap-up word) · the thing I keep coming back to

---

## Rules for the Critic (Summary)

1. **Be specific.** Reference paragraph numbers, quote the offending text, name the check.
2. **Reference actual context files.** Judge against the user's voice-dna.md, not generic
   writing standards.
3. **Don't over-polish.** Natural voice has imperfections. The goal is the user's prose, not
   sterile prose.
4. **Name the rule.** "AI Tell: significance inflation in paragraph 2" or "Voice: sentence
   length averaging 30+ words vs. usual 12–18."
5. **Don't just remove — replace.** Suggest what the user would actually say, based on their
   samples.
6. **Watch for over-correction.** Humans do occasionally use em dashes and triplets. The
   question is whether it's a pattern.
7. **3 rounds max.** Then hand it to the user with a note on what's left.
