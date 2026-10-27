#!/usr/bin/env bash
# Download the papers and supplementary PDFs for CS 6120 (Cornell, Fall 2025).
# The PDFs are copyrighted by their publishers/authors, so they are not stored
# in this repository. This script fetches them from public, author- or
# university-hosted copies. See REFERENCES.md for full citations.
#
# Usage:  ./fetch_pdfs.sh        (safe to re-run; skips files that already exist)
set -u
cd "$(dirname "$0")"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"
ok=0; fail=0; failed=()

# fetch <output path> <url> [fallback url ...]
fetch() {
  local out=$1; shift
  if [ -s "$out" ]; then echo "skip  $out"; return; fi
  mkdir -p "$(dirname "$out")"
  for url in "$@"; do
    if curl -sfL -A "$UA" --max-time 300 -o "$out.part" "$url" &&
       head -c 5 "$out.part" | grep -q -e '%PDF' -e '%!PS'; then
      mv "$out.part" "$out"; echo "ok    $out"; ok=$((ok+1)); return
    fi
  done
  rm -f "$out.part"; echo "FAIL  $out"; fail=$((fail+1)); failed+=("$out")
}

P=papers/discussion
fetch $P/2025-09-02_Mytkowicz2009_Producing-Wrong-Data.pdf \
  https://users.cs.northwestern.edu/~robby/courses/322-2013-spring/mytkowicz-wrong-data.pdf
fetch $P/2025-09-02_SIGPLAN-Empirical-Evaluation-Checklist.pdf \
  https://github.com/SIGPLAN/empirical-evaluation/raw/master/checklist/checklist.pdf
fetch $P/2025-09-25_Ball1996_Efficient-Path-Profiling.pdf \
  https://www.cs.purdue.edu/homes/xyzhang/spring07/Papers/pathprof.pdf \
  https://ftp1.cs.wisc.edu/wwt/micro96.pdf
fetch $P/2025-10-07_Braun2013_Simple-Efficient-SSA-Construction.pdf \
  https://c9x.me/compile/bib/braun13cc.pdf
fetch $P/2025-10-16_Lopes2015_Alive-Peephole-Verification.pdf \
  https://www.cs.utah.edu/~regehr/papers/pldi15.pdf
fetch $P/2025-10-30_Diwan1998_Type-Based-Alias-Analysis.pdf \
  https://bernsteinbear.com/assets/img/tbaa.pdf \
  https://people.cs.umass.edu/~moss/papers/pldi-1998-tbaa.pdf
fetch $P/2025-11-06_Bacon2004_Unified-Theory-of-GC.pdf \
  https://web.eecs.umich.edu/~weimerw/2014-4610/reading/bacon-garbage.pdf
fetch $P/2025-11-13_Chambers1989_SELF-Implementation_journal-version.pdf \
  https://bibliography.selflanguage.org/_static/implementation.pdf
fetch $P/2025-11-18_Gal2009_TraceMonkey.pdf \
  https://si.games.ucla.edu/student-portal/assets/pdfjs-2.4.456-dist/web/compressed.tracemonkey-pldi-09.pdf
fetch $P/2025-11-20_Joshi2002_Denali_SRC-tech-report.pdf \
  https://ftp.mirrorservice.org/sites/www.bitsavers.org/pdf/dec/tech_reports/SRC-RR-171.pdf
# PLDI version is PostScript; convert with: ps2pdf <file>.ps
fetch $P/2025-11-20_Joshi2002_Denali_PLDI.ps https://people.csail.mit.edu/randall/papers/denali.ps

F=papers/further-reading
fetch $F/Shahriyar2014_Fast-Conservative-GC.pdf \
  http://www.cs.utexas.edu/~mckinley/papers/conservative-gc-oopsla-2014.pdf
fetch $F/Powers2019_Mesh.pdf https://arxiv.org/pdf/1902.04738
fetch $F/Massalin1987_Superoptimizer.pdf \
  https://www.cse.iitm.ac.in/~krishna/courses/2022/odd-cs6013/MassalinCANews87.pdf
fetch $F/Phothilimthana2014_Chlorophyll_Berkeley-TR.pdf \
  https://www2.eecs.berkeley.edu/Pubs/TechRpts/2015/EECS-2015-121.pdf
fetch $F/Boehm2005_Threads-Cannot-Be-Library.pdf \
  https://www.read.seas.harvard.edu/~kohler/class/aosref/boehm05threads.pdf
fetch $F/Larsen2000_Superword-Level-Parallelism.pdf \
  https://groups.csail.mit.edu/cag/slp/SLP-PLDI-2000.pdf
fetch $F/Bocchino2009_Deterministic-Parallel-Java.pdf \
  http://dpj.cs.illinois.edu/DPJ/Publications_files/DPJ-OOPSLA-2009.pdf
fetch $F/Leroy2009_CompCert-Formal-Verification.pdf \
  https://xavierleroy.org/publi/compcert-CACM.pdf
fetch $F/Lattner2020_MLIR.pdf https://arxiv.org/pdf/2002.11054
fetch $F/Tate2009_Equality-Saturation.pdf \
  https://rosstate.org/publications/eqsat/eqsat_tate_popl09.pdf

S=supplementary
fetch $S/L01_Scott2001_On-Proebstings-Law.pdf https://gwern.net/doc/cs/algorithm/2001-scott.pdf
fetch $S/L03_CMU15745_L3-Local-Optimizations.pdf \
  http://www.cs.cmu.edu/afs/cs/academic/class/15745-s19/www/lectures/L3-Local-Opts.pdf
fetch $S/L04_Moller-Schwartzbach_Static-Program-Analysis-book.pdf https://cs.au.dk/~amoeller/spa/spa.pdf
fetch $S/L04_Cornell-CS4120_Dataflow-Analysis.pdf \
  https://www.cs.cornell.edu/courses/cs4120/2019sp/lectures/20dataflow/lec20-sp16.pdf
fetch $S/L06_Appel1998_SSA-is-Functional-Programming.pdf https://www.cs.princeton.edu/~appel/papers/ssafun.pdf
fetch $S/L06_Boissinot2009_Revisiting-Out-of-SSA.pdf https://bernsteinbear.com/assets/img/boissinot-out-ssa.pdf
fetch $S/L06_Briggs1998_Practical-Improvements-SSA.pdf https://bernsteinbear.com/assets/img/briggs-ssa.pdf
fetch $S/L06_CMU15745_L13-SSA-Concepts.pdf \
  http://www.cs.cmu.edu/afs/cs/academic/class/15745-s12/public/lectures/L13-SSA-Concepts-1up.pdf
fetch $S/L08_Briggs-Cooper-Simpson_Value-Numbering.pdf \
  https://www.cs.tufts.edu/~nr/cs257/archive/keith-cooper/value-numbering.pdf
fetch $S/L08_UTexas-CS380C_Lec24.pdf https://www.cs.utexas.edu/users/mckinley/380C/lecs/24.pdf
fetch $S/L08_Harvard-CS153_Loop-Optimization-II.pdf \
  https://www.seas.harvard.edu/courses/cs153/2018fa/lectures/Lec19-Loop-Optimization-II.pdf
fetch $S/L08_CMU15745_L10-Lazy-Code-Motion.pdf \
  http://www.cs.cmu.edu/afs/cs/academic/class/15745-s19/www/lectures/L10-Lazy-Code-Motion.pdf
fetch $S/L08_CMU15745_L8-Induction-Variables.pdf \
  http://www.cs.cmu.edu/afs/cs/academic/class/15745-s19/www/lectures/L8-Induction-Variables.pdf
fetch $S/L10_Smaragdakis-Balatsouras_Pointer-Analysis-tutorial.pdf https://yanniss.github.io/points-to-tutorial15.pdf
fetch $S/L13_Lamport1978_Time-Clocks-Ordering.pdf https://lamport.azurewebsites.net/pubs/time-clocks.pdf

echo
echo "Downloaded: $ok   Failed: $fail"
if [ $fail -gt 0 ]; then
  echo "Download these manually in a browser (links in REFERENCES.md):"
  printf '  %s\n' "${failed[@]}"
fi
echo "Not scriptable — get from the publisher's free open-access page:"
echo "  Nagarajan et al., A Primer on Memory Consistency and Cache Coherence (2e):"
echo "  https://link.springer.com/book/10.1007/978-3-031-01764-3"
