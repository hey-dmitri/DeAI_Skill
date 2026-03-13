# DeAI Agent

save it as [critic-agent.md](http://critic-agent.md) in your context folder

# DeAI Agent Protocol

When asked to "run the deAI," follow this review process on the current output.

## Process

1. Spin up a sub-agent to act as a Critic.
2. The Critic reviews the full output against ALL context files ([voice-dna.md](http://voice-dna.md), and any other context files in the folder).
3. The Critic assigns a rating: **Needs Work**, **Good**, or **Excellent**.
4. If below Excellent, the Critic provides specific, actionable feedback referencing the exact rules or samples it's checking against.
5. Revise the output based on feedback.
6. Run the Critic again on the revised version.
7. Repeat until Excellent, or until 3 review rounds complete (whichever comes first).

## What the Critic Checks

### 1. Voice Match

- Does this read like the writing samples? Same rhythm, sentence length, formality level?
- Any banned phrases present? (Check the full Banned Phrase List below — every single one.)
- Does it use words and phrases you actually use?
- Would someone who knows you recognize your voice?

### 2. Substance

- Does the output actually answer what was asked, or an adjacent version of it?
- Are claims specific and grounded, or vague and generic?
- Is anything padded or restated in different words to seem thorough?
- Is the output getting *less specific and more congratulatory* as it goes? (This is the core AI failure mode — statistical regression to the mean. Specific facts fade into generic positive statements. Watch for it.)

### 3. AI Tell Detection

This is separate from voice and substance. Text can match your voice and say something real, but still have structural fingerprints that scream "a robot wrote this." Scan for these:

**Significance inflation.** Does the text puff up importance with phrases like "marking a pivotal moment," "setting the stage for," "reflects broader trends," "a testament to"? Does it bolt superficial analysis onto facts using trailing -ing phrases ("...highlighting its enduring legacy," "...underscoring the importance of")? Kill these on sight.

**The challenge/future formula.** Does the text follow the pattern: "Despite its [positive things], [subject] faces challenges..." then end with "Despite these challenges, [subject] continues to..."? This is one of the most recognizable AI structures. Rewrite from scratch if present.

**Rule of three abuse.** AI loves triplets: "innovation, collaboration, and excellence" or "keynote sessions, panel discussions, and networking opportunities." One or two is fine. When every sentence has three parallel items, it's a pattern, not a stylistic choice.

**Copulative avoidance.** AI replaces simple verbs with inflated ones. "Is" becomes "serves as" or "stands as." "Has" becomes "features" or "boasts." If the text is allergic to "is" and "are," flag it.

**Negative parallelism.** "Not just X, but also Y" and "It's not about X, it's about Y" — AI uses these constantly to appear balanced. Once or twice is fine. A pattern of them is a tell.

**Elegant variation.** AI avoids repeating words by cycling through synonyms unnecessarily. If a company is called "the firm," "the organization," "the enterprise," and "the tech giant" within four sentences, that's AI synonym-cycling, not good writing. Just use the name.

**False ranges.** "From X to Y" constructions where X and Y aren't actually endpoints of a meaningful scale. "From community engagement to technological innovation" isn't a range. It's two unrelated things wearing a trenchcoat.

**Vague attribution.** "Experts argue," "Industry reports suggest," "Observers have noted" — with no specific expert, report, or observer named. If the text can't name the source, the claim is probably invented or inflated.

**Press-release tone.** "Commitment to excellence," "fostering community development," "aligning with strategic goals." If it sounds like it belongs in a quarterly earnings call, it doesn't belong in your writing.

### 4. Formatting Tells

These are visual and structural patterns. Scan the output for:

- **Em dash overuse** — AI uses em dashes where commas or parentheses would be more natural. One or two per piece is fine. Five or more is a tell, especially if they feel "punchy" in a sales-copy way.
- **Title Case In Every Heading** — if section headers capitalize every main word, that's AI default behavior.
- **Excessive boldface** — bolding terms for emphasis in a mechanical, "key takeaways" pattern.
- **Inline-header lists** — bullet points formatted as "**Bold header:** followed by description text." This is AI's favorite list structure.
- **Emoji in headers or bullets** — unless the voice-dna explicitly uses emoji, flag any.

### Final Bar

- Would you send, publish, or present this without editing?
- If not, what specifically needs to change?

---

## Banned Phrase List

The Critic must check for ALL of these. Any occurrence = automatic flag.

### Tier 1: Hard Kill (remove or rewrite immediately)

These are the most recognizable AI tells. Their presence in any professional writing is a red flag.

| Word/Phrase | Why it's banned |
| --- | --- |
| delve / delves / delving | The single most infamous AI word. Dead giveaway. |
| tapestry (figurative) | "Rich tapestry of culture" — pure AI filler. |
| landscape (figurative) | "The evolving landscape of..." — meaningless. |
| testament (to) | "A testament to their dedication" — AI puffery. |
| pivotal | Almost never used by humans in casual writing. |
| underscore (as verb) | "This underscores the importance" — AI signature. |
| intricate / intricacies | AI uses this to sound thoughtful. It isn't. |
| meticulous / meticulously | AI's favorite way to describe any process. |
| vibrant | Especially "vibrant community" or "vibrant culture." |
| tapestry | Yes, it's here twice. That's how bad it is. |
| nestled | "Nestled in the heart of" — instant AI detection. |
| in the heart of | See above. |
| groundbreaking (figurative) | AI calls everything groundbreaking. |
| indelible mark | Nobody writes this in real life. |
| set the stage for | AI transition phrase. |
| a testament to | See testament above. |

### Tier 2: Flag and Evaluate (not always bad, but suspicious in clusters)

One of these in isolation might be fine. Three or more in the same piece = AI pattern.

| Word/Phrase | Notes |
| --- | --- |
| Additionally (starting a sentence) | AI's favorite transition word. |
| crucial | Overused by AI since 2023. |
| bolstered | Rare in human casual writing. |
| garner | "Garnered attention" — AI loves this. |
| enduring | "Enduring legacy" — AI filler. |
| fostering | "Fostering innovation" — press-release language. |
| showcasing | AI's replacement for "showing." |
| enhance / enhancing | AI's replacement for "improve." |
| align with | "Aligning with goals" — corporate AI speak. |
| highlight (as verb) | "This highlights" — AI analysis filler. |
| encompassing | AI's word for "including." |
| profound | AI calls everything profound. |
| renowned | AI calls everyone renowned. |
| diverse array | "A diverse array of" — AI noise. |
| commitment to | "Commitment to excellence" — press release. |
| serves as / stands as | AI's replacement for "is." (See copulative avoidance.) |
| marks / represents (a) | Same pattern — inflated replacement for "is." |
| boasts / features / offers (a) | AI's replacement for "has." |
| Not just X, but also Y | AI parallelism. Flag if it appears more than once. |
| Despite its... faces challenges | The challenge formula. Always rewrite. |
| from [X] to [Y] (figurative) | Check if the range is real. If not, it's a false range. |

### Tier 3: Tone Leakage (AI talking to you, not writing for the audience)

These indicate chatbot communication was pasted or leaked into the output.

| Phrase | What it signals |
| --- | --- |
| In this section, we will discuss | AI preamble — not article text. |
| I hope this helps | Chatbot sign-off. |
| Would you like me to... | Chatbot offer. |
| It's important to note | AI disclaimer / hedging. |
| It's worth noting | Same pattern. |
| Based on available information | Knowledge-cutoff disclaimer. |
| maintains a low profile | AI speculation about why info is missing. |
| keeps personal details private | Same pattern — AI guessing, not reporting. |
| In summary / In conclusion | AI section summary habit. |
| Overall | AI wrap-up word. |

---

## Rules for the Critic

- **Be specific.** "The tone is off" is useless. "Paragraph 3 uses 'Furthermore' which is banned, and the structure is more formal than any writing sample" is useful.
- **Reference actual context files**, not general standards.
- **Don't over-polish.** Natural voice includes imperfections, casual language, and hedging. That's a feature, not a bug. The goal is not sterile prose — it's *your* prose.
- **Name the rule.** When flagging something, say which check caught it: "AI Tell: significance inflation in paragraph 2" or "Voice: sentence length averaging 30+ words vs. your usual 12-18."
- **Don't just remove — replace.** If you flag a banned phrase, suggest what the writer would actually say instead, based on the voice samples.
- **Watch for over-correction.** Stripping every em dash, every triplet, every "crucial" can make text robotic in a different way. The goal is writing that sounds human, not writing that's been through a metal detector.
- **3 rounds max.**