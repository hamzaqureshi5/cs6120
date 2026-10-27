# CS 6120: Advanced Compilers — Self-Study Workspace

A personal study workspace for **Cornell CS 6120: Advanced Compilers** (Fall 2025, [Adrian Sampson](https://www.cs.cornell.edu/~asampson/)),
following the course's official [self-guided curriculum](https://www.cs.cornell.edu/courses/cs6120/2025fa/self-guided/).

- Course site: https://www.cs.cornell.edu/courses/cs6120/2025fa/
- Course source: https://github.com/sampsyo/cs6120 (MIT license)
- Bril (the course IR): https://github.com/sampsyo/bril · docs: https://capra.cs.cornell.edu/bril/

> CS 6120 has **no slide decks**. Each lesson is written notes + a video. The notes are the primary text;
> videos are free on [Kaltura](https://vod.video.cornell.edu/channel/CS%2B6120/179754792) / [Box](https://cornell.box.com/s/wb3387ebfbte9btx3weekmc8nij5glep).

---

## Quick start

```bash
# 1. Clone with submodules (Bril + course source)
git clone --recurse-submodules https://github.com/hamzaqureshi5/cs6120.git
cd cs6120

# 2. Download the papers and supplementary PDFs (not stored in git — copyright)
./fetch_pdfs.sh

# 3. Install the Bril toolchain (needs Deno + Python)
curl -fsSL https://deno.land/install.sh | sh
export PATH="$HOME/.deno/bin:$PATH"          # add to ~/.bashrc
cd code/bril
deno install -g brili.ts                      # interpreter
deno install -g brilck.ts                     # type checker
pip install ./bril-txt turnt                  # bril2json/bril2txt + snapshot testing
bril2json < test/interp/core/add.bril | brili # smoke test — should print a number
cd ../..
```

If you cloned without `--recurse-submodules`, run `git submodule update --init`.

## Repository layout

| Path | What it is |
|---|---|
| `website/2025fa/` | Offline mirror of the course site — open `website/2025fa/index.html`. All 14 lessons, syllabus, schedule, self-guided page, student blog posts. |
| `code/cs6120-course-source/` | *(submodule)* Course site source. **Lesson notes as Markdown:** `content/lesson/N.md`. |
| `code/bril/` | *(submodule)* Bril IR, interpreter, tools, `benchmarks/`, `examples/`. Every task uses it. |
| `papers/discussion/` | Discussion papers, prefixed by class date *(created by `fetch_pdfs.sh`)* |
| `papers/further-reading/` | Extra papers from the self-guided curriculum *(created by `fetch_pdfs.sh`)* |
| `supplementary/` | Slides/papers linked from lesson notes, prefixed `L<lesson>_` *(created by `fetch_pdfs.sh`)* |
| `REFERENCES.md` | Full citations and source links for every PDF |
| `fetch_pdfs.sh` | Downloads all PDFs; safe to re-run |
| `my-work/` | Your task implementations (create it) |
| `learning/` | Roadmap, notes, and progress tracking (create it) |

## How to work through the course

### The loop, for each lesson
1. **Read the notes** — `website/2025fa/lesson/N/index.html` (or `code/cs6120-course-source/content/lesson/N.md`).
2. **Watch the video(s)** linked at the top of the lesson page.
3. **Skim the supplementary slides** for that lesson in `supplementary/L0N_*`.
4. **Do the implementation tasks** at the bottom of the notes, in `my-work/lessonN/`. Any language works; Python is the easiest start.
5. **Test seriously** — run your pass over every program in `code/bril/benchmarks/` with [Brench](https://capra.cs.cornell.edu/bril/tools/brench.html), checking that output is unchanged and dynamic instruction count goes down. Use [Turnt](https://github.com/cucapra/turnt) for snapshot tests.
6. **Write a short summary** (what you built, how you tested it, what was hard) — this replaces the Zulip/GitHub post the real course asks for.
7. **Read the paper(s)** scheduled next; write 3–4 sentences each (problem, key idea, one weakness), then compare with the student blog post in `website/2025fa/blog/`.

### Suggested order (from the self-guided curriculum)

| # | Lesson | Main task | Read afterward |
|---|---|---|---|
| 1 | Welcome & Overview | read the syllabus | Mytkowicz *Wrong Data*, SIGPLAN checklist |
| 2 | Representing Programs | get to know Bril; basic blocks + CFG | — |
| 3 | Local Analysis & Optimization | trivial DCE + **local value numbering** ⭐ | — |
| 4 | Data Flow | generic data-flow framework | — |
| 5 | Global Analysis | dominators, dominance frontier | Ball–Larus *Path Profiling* |
| 6 | Static Single Assignment | **into and out of SSA** ⭐ | Braun *SSA*, Alive |
| 7 | LLVM | write an LLVM pass | — |
| 8 | Loop Optimization | a loop optimization (e.g. LICM) | — |
| 9 | Interprocedural Analysis | — | TBAA |
| 10 | Alias Analysis | — | Unified GC, Conservative GC |
| 11 | Memory Management | garbage collector for Bril | SELF, TraceMonkey |
| 12 | Dynamic Compilers | tracing JIT for Bril | Massalin, Denali, Chlorophyll |
| 13 | Concurrency & Parallelism | — | Boehm, SLP, DPJ, CompCert |
| 14 | Fast Compilers | — | — |

⭐ = hardest and most important tasks — budget extra time.

**Pace:** about one lesson per week, 6–10 hours for lessons with tasks — roughly 3–4 months total.
Finish with an open-ended project (extend a pass, or reproduce an idea from a paper); see past projects in `website/2025fa/blog/`.

### What to skip as a self-learner
Zulip, CMS submissions, claiming a paper to lead, and deadlines are for enrolled Cornell students only.

## Keeping things up to date
```bash
git submodule update --remote   # pull latest Bril and course source
./fetch_pdfs.sh                 # fetch any PDFs you're missing
```

## Copyright
Course materials (site, notes, Bril) are © Adrian Sampson and contributors under the MIT license.
Papers and slides belong to their respective authors and publishers and are **not** redistributed here —
`fetch_pdfs.sh` downloads them from public copies for personal study. See [REFERENCES.md](REFERENCES.md).
