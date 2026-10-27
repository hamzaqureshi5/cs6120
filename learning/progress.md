# CS 6120 Progress Tracker

How to use:
- Tick a box by changing `- [ ]` to `- [x]`. Tick it only when you can explain the topic without looking at the notes, not just after reading it.
- Mark a subsection you're partway through with `- [~]`.
- Run `python3 learning/next.py` to see your overall progress and the next unfinished item.
- After each study session, add one line to the **Session log** at the bottom.

Each lesson has three kinds of subsection:
- 📖 **Learn**: concepts from the lesson notes (`website/2025fa/lesson/N/`) and videos
- 🛠 **Task**: implementation work, done in `my-work/lessonN/`
- 📄 **Read**: papers to read after the lesson (`papers/`, `supplementary/`)

Subsections follow the headings and bullet points of the official lesson notes.

---

## Lesson 1 — Welcome & Overview
- [ ] 1.1 📖 What a compiler is and why it matters (language implementation, not just speed)
- [ ] 1.2 📖 Proebsting's Law: how much do optimizations really help? (`supplementary/L01_Scott2001_On-Proebstings-Law.pdf`)
- [ ] 1.3 📖 Course structure: lessons, tasks, papers, project (read the syllabus)
- [ ] 1.4 📄 Mytkowicz et al., *Producing Wrong Data Without Doing Anything Obviously Wrong!*
- [ ] 1.5 📄 SIGPLAN Empirical Evaluation Guidelines + checklist

## Lesson 2 — Representing Programs
- [ ] 2.1 📖 Program representations: concrete syntax vs. AST vs. instructions
- [ ] 2.2 📖 Basic blocks and terminators (`jmp`, `br`); the algorithm for forming blocks
- [ ] 2.3 📖 Control flow graph (CFG): successors, predecessors, and the algorithm for building it
- [ ] 2.4 📖 Bril: philosophy, JSON format, text format, `brili` interpreter
- [ ] 2.5 📖 Snapshot testing with Turnt
- [ ] 2.6 🛠 Set up the toolchain (Deno, `brili`, `bril2json`, Turnt) and run a benchmark
- [ ] 2.7 🛠 Write a new Bril benchmark and run it with `brili`
- [ ] 2.8 🛠 Write a small Bril analysis/transformation tool (e.g. count `add` instructions)
- [ ] 2.9 🛠 Test your tool with Turnt
- [ ] 2.10 🛠 Implement basic-block formation + CFG construction

## Lesson 3 — Local Analysis & Optimization
- [ ] 3.1 📖 Dead code elimination (DCE): globally unused instructions
- [ ] 3.2 📖 Locally killed instructions (reassigned before use); iterate until nothing changes
- [ ] 3.3 📖 Local value numbering (LVN): the table, canonical values, common subexpressions
- [ ] 3.4 📖 Extending LVN: copy propagation, constant folding, commutativity
- [ ] 3.5 📖 Testing optimizations: correctness + dynamic instruction count, Brench
- [ ] 3.6 📖 Supplementary: CMU 15-745 L3 slides (`supplementary/L03_*`)
- [ ] 3.7 🛠 Implement trivial DCE (iterate until nothing changes)
- [ ] 3.8 🛠 Implement LVN (+ pair it with DCE)
- [ ] 3.9 🛠 Show evidence of correctness and speedup across all Bril benchmarks (Brench)
- [ ] 3.10 🛠 Bonus: extend LVN to handle the trickier in-class examples

## Lesson 4 — Data Flow
- [ ] 4.1 📖 Reaching definitions; terminology: use, definition, available, kills
- [ ] 4.2 📖 The data flow framework: direction, initial value, transfer function, merge
- [ ] 4.3 📖 The worklist algorithm
- [ ] 4.4 📖 Theory: partial orders, meet ⊓, monotonicity, termination, meet-over-all-paths
- [ ] 4.5 📖 More analyses: live variables, constant propagation, available expressions, initialized variables, intervals
- [ ] 4.6 📖 Supplementary: CS 4120 dataflow notes + *Static Program Analysis* Ch. 5
- [ ] 4.7 🛠 Implement at least one data flow analysis
- [ ] 4.8 🛠 Bonus: generic solver supporting multiple analyses
- [ ] 4.9 🛠 Convince yourself it's correct (tests)

## Lesson 5 — Global Analysis
- [ ] 5.1 📖 Dominance: dominates, strictly dominates, immediately dominates
- [ ] 5.2 📖 Dominator tree
- [ ] 5.3 📖 Dominance frontier; post-dominance
- [ ] 5.4 📖 Natural loops, backedges, reducible CFGs
- [ ] 5.5 📖 Preview: loop-invariant code motion (LICM)
- [ ] 5.6 🛠 Compute dominators for a function
- [ ] 5.7 🛠 Build the dominator tree
- [ ] 5.8 🛠 Compute the dominance frontier
- [ ] 5.9 🛠 Test it algorithmically (e.g. brute-force check over all CFG paths)
- [ ] 5.10 📄 Ball & Larus, *Efficient Path Profiling*

## Lesson 6 — Static Single Assignment (SSA)
- [ ] 6.1 📖 ϕ-nodes
- [ ] 6.2 📖 The SSA philosophy: definitions = variables, instructions = values, arguments = data-flow edges
- [ ] 6.3 📖 Converting to SSA: basic version
- [ ] 6.4 📖 Converting to SSA: full version (dominance frontiers, renaming)
- [ ] 6.5 📖 Converting out of SSA
- [ ] 6.6 📖 Alternative representations: classic SSA subtleties, block arguments, Pizlo's Upsilon/Phi
- [ ] 6.7 📖 Bril in SSA form (the SSA extension)
- [ ] 6.8 📖 Supplementary: CMU SSA slides, Appel *SSA is Functional Programming*, Boissinot, Briggs
- [ ] 6.9 🛠 Implement "into SSA"
- [ ] 6.10 🛠 Implement "out of SSA"
- [ ] 6.11 🛠 Verify: output passes `is_ssa.py`; round trip preserves behavior on benchmarks
- [ ] 6.12 🛠 Measure the extra instructions a round trip adds
- [ ] 6.13 📄 Braun et al., *Simple and Efficient Construction of SSA Form*
- [ ] 6.14 📄 Lopes et al., *Provably Correct Peephole Optimizations with Alive*

## Lesson 7 — LLVM
- [ ] 7.1 📖 What LLVM is: IR, passes, tools
- [ ] 7.2 📖 Getting started: building/installing, clang, `opt`, reading LLVM IR
- [ ] 7.3 📖 Writing a pass ("LLVM for Grad Students" blog post)
- [ ] 7.4 🛠 Implement an LLVM pass that changes program execution
- [ ] 7.5 🛠 Run your pass on a real-ish C/C++ program

## Lesson 8 — Loop Optimization
- [ ] 8.1 📖 Why loops matter; recap of natural loops
- [ ] 8.2 📖 Loop-invariant code motion (LICM): conditions for safely moving code out of a loop
- [ ] 8.3 📖 Induction variable elimination: basic and derived induction variables, strength reduction
- [ ] 8.4 📖 Loop unswitching
- [ ] 8.5 📖 Loop fusion and fission
- [ ] 8.6 📖 Global optimizations overview: unrolling, interchange, peeling, GVN, PRE, lazy code motion
- [ ] 8.7 📖 Supplementary: CMU induction-variable and lazy-code-motion slides, Harvard loop-optimization slides, value-numbering paper
- [ ] 8.8 🛠 Choose Bril or LLVM, then choose an optimization
- [ ] 8.9 🛠 Implement the loop optimization
- [ ] 8.10 🛠 Evaluate it rigorously (SIGPLAN guidelines; Bril benchmarks or Embench)

## Lesson 9 — Interprocedural Analysis
- [ ] 9.1 📖 The call graph
- [ ] 9.2 📖 Open vs. closed world; whole-program analysis; LTO and JITs
- [ ] 9.3 📖 Inlining: benefits, costs, heuristics
- [ ] 9.4 📖 Devirtualization
- [ ] 9.5 📖 Context sensitivity
- [ ] 9.6 🛠 Optional: implement inlining for Bril
- [ ] 9.7 📄 Diwan et al., *Type-Based Alias Analysis*

## Lesson 10 — Alias Analysis
- [ ] 10.1 📖 Motivation: pointers in C, Java, ML, Bril's memory extension
- [ ] 10.2 📖 The alias problem: must-alias, must-not-alias, may-alias queries
- [ ] 10.3 📖 Alias analysis as data flow (domain, transfer functions for `alloc`, `id`, `ptradd`, …)
- [ ] 10.4 📖 Heap models
- [ ] 10.5 📖 Context-sensitive alias analysis
- [ ] 10.6 📖 Supplementary: Smaragdakis & Balatsouras pointer-analysis tutorial
- [ ] 10.7 🛠 Optional: may-alias analysis for Bril pointers
- [ ] 10.8 📄 Bacon et al., *A Unified Theory of Garbage Collection*
- [ ] 10.9 📄 Shahriyar et al., *Fast Conservative Garbage Collection*

## Lesson 11 — Memory Management
- [ ] 11.1 📖 Why manual memory management fails (memory-safety bugs)
- [ ] 11.2 📖 Terminology: collector, mutator, live, dead
- [ ] 11.3 📖 Reference counting vs. tracing (mark/sweep)
- [ ] 11.4 📖 Tracing refinements: copying/semispace, generational, concurrent, conservative
- [ ] 11.5 🛠 Implement a GC (refcount or semispace) in the Bril interpreter
- [ ] 11.6 🛠 Verify: benchmarks still work with `free` removed; all garbage is collected
- [ ] 11.7 📄 Chambers et al., *SELF*
- [ ] 11.8 📄 Gal et al., *TraceMonkey*

## Lesson 12 — Dynamic Compilers
- [ ] 12.1 📖 Motivation: run-time information and dynamic languages
- [ ] 12.2 📖 "Interpreted vs. compiled" is a spectrum
- [ ] 12.3 📖 Anatomy of a JIT: interpreter, hotness detection, profiler, optimizing compiler, switching between modes
- [ ] 12.4 📖 Method JITs vs. tracing JITs
- [ ] 12.5 📖 Tracing in more depth: guards, speculation, side exits
- [ ] 12.6 🛠 Modify the reference interpreter to record traces
- [ ] 12.7 🛠 Stitch traces back into the program with `speculate`/`guard`/`commit`
- [ ] 12.8 🛠 Check correctness on multiple inputs; measure dynamic instruction count
- [ ] 12.9 📄 Massalin, *Superoptimizer*
- [ ] 12.10 📄 Joshi et al., *Denali*
- [ ] 12.11 📄 Phothilimthana et al., *Chlorophyll*

## Lesson 13 — Concurrency & Parallelism
- [ ] 13.1 📖 Why parallelism (end of Moore's law); programming models: message passing, shared memory, data/task parallelism, actors
- [ ] 13.2 📖 What shared-memory multithreading means (imaginary threads extension to Bril)
- [ ] 13.3 📖 Sequential consistency; happens-before (Lamport); a C program that violates SC
- [ ] 13.4 📖 Memory models: data races, C++11 memory model, DRF⇒SC, Java memory model
- [ ] 13.5 📖 *Threads cannot be implemented as a library*
- [ ] 13.6 📖 Supplementary: Lamport *Time, Clocks*; memory-consistency primer
- [ ] 13.7 📄 Boehm, *Threads Cannot Be Implemented as a Library*
- [ ] 13.8 📄 Larsen & Amarasinghe, *Superword Level Parallelism*
- [ ] 13.9 📄 Bocchino et al., *Deterministic Parallel Java*
- [ ] 13.10 📄 Leroy, *Formal Verification of a Realistic Compiler* (CompCert)

## Lesson 14 — Fast Compilers
- [ ] 14.1 📖 Why compiler speed matters (JITs; ahead-of-time compilers)
- [ ] 14.2 📖 What determines compiler speed: algorithmic complexity, host-language overhead, grammar, data structures
- [ ] 14.3 📖 Flat profiles: why compilers have no single bottleneck and are rarely parallel
- [ ] 14.4 📖 Data-structure flattening (blog post: *Flattening ASTs*)
- [ ] 14.5 📖 Interpreters that exploit flat representations

## Final project
- [ ] P.1 Pick a project idea (extend a pass, or reproduce a paper's idea); see `website/2025fa/blog/`
- [ ] P.2 Write a short proposal: goal, approach, how you'll evaluate it
- [ ] P.3 Implement it
- [ ] P.4 Evaluate it (SIGPLAN guidelines)
- [ ] P.5 Write it up as a blog-style post

---

## Session log
<!-- One line per session: date — what you covered — where to resume — open questions -->
| Date | Covered | Resume at | Notes / questions |
|---|---|---|---|
| | | 1.1 | |
