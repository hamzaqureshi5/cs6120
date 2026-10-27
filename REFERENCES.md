# References

All readings for CS 6120 (Cornell, Fall 2025), as listed in the course
[schedule](https://www.cs.cornell.edu/courses/cs6120/2025fa/schedule/),
[self-guided curriculum](https://www.cs.cornell.edu/courses/cs6120/2025fa/self-guided/) and lesson notes.
PDFs are **not** stored in this repo (copyright belongs to the authors/publishers).
Run `./fetch_pdfs.sh` to download them from public copies into the paths shown.

## Discussion papers (in class order)
| Date | Paper | Local file (`papers/discussion/`) |
|---|---|---|
| Sep 2 | T. Mytkowicz, A. Diwan, M. Hauswirth, P. F. Sweeney. *Producing Wrong Data Without Doing Anything Obviously Wrong!* ASPLOS 2009. [ACM](https://dl.acm.org/doi/10.1145/1508244.1508275) | `2025-09-02_Mytkowicz2009_…` |
| Sep 2 | *SIGPLAN Empirical Evaluation Guidelines.* [web](https://www.sigplan.org/Resources/EmpiricalEvaluation/) | `2025-09-02_SIGPLAN-…-Checklist.pdf` |
| Sep 25 | T. Ball, J. R. Larus. *Efficient Path Profiling.* MICRO 1996. [IEEE](https://doi.org/10.1109/MICRO.1996.566449) | `2025-09-25_Ball1996_…` |
| Oct 7 | M. Braun, S. Buchwald, S. Hack, R. Leißa, C. Mallon, A. Zwinkau. *Simple and Efficient Construction of Static Single Assignment Form.* CC 2013. [PDF](https://c9x.me/compile/bib/braun13cc.pdf) | `2025-10-07_Braun2013_…` |
| Oct 16 | N. P. Lopes, D. Menendez, S. Nagarakatte, J. Regehr. *Provably Correct Peephole Optimizations with Alive.* PLDI 2015. [ACM](https://dl.acm.org/doi/10.1145/2737924.2737965) | `2025-10-16_Lopes2015_…` |
| Oct 30 | A. Diwan, K. S. McKinley, J. E. B. Moss. *Type-Based Alias Analysis.* PLDI 1998. [ACM](https://dl.acm.org/doi/10.1145/277650.277670) | `2025-10-30_Diwan1998_…` |
| Nov 6 | D. F. Bacon, P. Cheng, V. T. Rajan. *A Unified Theory of Garbage Collection.* OOPSLA 2004. [ACM](https://dl.acm.org/doi/10.1145/1028976.1028982) · **manual download:** [PDF](http://web.eecs.umich.edu/~weimerw/2014-4610/reading/bacon-garbage.pdf) | `2025-11-06_Bacon2004_…` |
| Nov 13 | C. Chambers, D. Ungar, E. Lee. *An Efficient Implementation of SELF…* OOPSLA 1989. [ACM](https://dl.acm.org/doi/10.1145/74877.74884) (script fetches the longer journal version) | `2025-11-13_Chambers1989_…` |
| Nov 18 | A. Gal, B. Eich, et al. *Trace-Based Just-in-Time Type Specialization for Dynamic Languages.* PLDI 2009. [ACM](https://dl.acm.org/doi/10.1145/1542476.1542528) | `2025-11-18_Gal2009_…` |
| Nov 20 | R. Joshi, G. Nelson, K. Randall. *Denali: A Goal-Directed Superoptimizer.* PLDI 2002. [ACM](https://dl.acm.org/doi/10.1145/543552.512566) (script fetches the SRC tech report + PLDI PostScript) | `2025-11-20_Joshi2002_…` |

## Further reading (self-guided curriculum)
| Paper | Local file (`papers/further-reading/`) |
|---|---|
| R. Shahriyar, S. M. Blackburn, K. S. McKinley. *Fast Conservative Garbage Collection.* OOPSLA 2014. | `Shahriyar2014_…` |
| B. Powers, D. Tench, E. D. Berger, A. McGregor. *Mesh: Compacting Memory Management for C/C++ Applications.* PLDI 2019. [arXiv](https://arxiv.org/abs/1902.04738) | `Powers2019_Mesh.pdf` |
| H. Massalin. *Superoptimizer: A Look at the Smallest Program.* ASPLOS 1987. **manual download:** [PDF](https://www.cse.iitm.ac.in/~krishna/courses/2022/odd-cs6013/MassalinCANews87.pdf) | `Massalin1987_…` |
| P. M. Phothilimthana et al. *Chlorophyll: Synthesis-Aided Compiler for Low-Power Spatial Architectures.* PLDI 2014. (Berkeley TR version) | `Phothilimthana2014_…` |
| H.-J. Boehm. *Threads Cannot Be Implemented as a Library.* PLDI 2005. | `Boehm2005_…` |
| S. Larsen, S. Amarasinghe. *Exploiting Superword Level Parallelism with Multimedia Instruction Sets.* PLDI 2000. | `Larsen2000_…` |
| R. L. Bocchino et al. *A Type and Effect System for Deterministic Parallel Java.* OOPSLA 2009. | `Bocchino2009_…` |
| X. Leroy. *Formal Verification of a Realistic Compiler.* CACM 2009. | `Leroy2009_…` |
| C. Lattner et al. *MLIR: A Compiler Infrastructure for the End of Moore's Law.* 2020. [arXiv](https://arxiv.org/abs/2002.11054) | `Lattner2020_MLIR.pdf` |
| R. Tate, M. Stepp, Z. Tatlock, S. Lerner. *Equality Saturation: A New Approach to Optimization.* POPL 2009. | `Tate2009_…` |

## Supplementary material linked from lesson notes (`supplementary/`)
| Lesson | Resource |
|---|---|
| 1 | K. Scott. *On Proebsting's Law.* 2001. |
| 3 | CMU 15-745 (S19), L3: Local Optimizations (slides) |
| 4 | A. Møller, M. I. Schwartzbach. *Static Program Analysis* (book). [web](https://cs.au.dk/~amoeller/spa/) |
| 4 | Cornell CS 4120, Dataflow Analysis (lecture notes) |
| 6 | A. W. Appel. *SSA is Functional Programming.* SIGPLAN Notices 1998. |
| 6 | B. Boissinot et al. *Revisiting Out-of-SSA Translation for Correctness, Code Quality, and Efficiency.* CGO 2009. |
| 6 | P. Briggs, K. D. Cooper, T. J. Harvey, L. T. Simpson. *Practical Improvements to the Construction and Destruction of SSA Form.* SP&E 1998. |
| 6 | CMU 15-745 (S12), L13: SSA Concepts (slides) |
| 8 | P. Briggs, K. D. Cooper, L. T. Simpson. *Value Numbering.* SP&E 1997. |
| 8 | UT Austin CS 380C, Lecture 24 (slides) |
| 8 | Harvard CS 153 (F18), Loop Optimization II (slides) |
| 8 | CMU 15-745 (S19), L10: Lazy Code Motion; L8: Induction Variables (slides) |
| 10 | Y. Smaragdakis, G. Balatsouras. *Pointer Analysis.* Foundations and Trends in PL, 2015. |
| 13 | L. Lamport. *Time, Clocks, and the Ordering of Events in a Distributed System.* CACM 1978. |
| 13 | V. Nagarajan, D. J. Sorin, M. D. Hill, D. A. Wood. *A Primer on Memory Consistency and Cache Coherence*, 2nd ed. 2020 — free: [Springer](https://link.springer.com/book/10.1007/978-3-031-01764-3) |
