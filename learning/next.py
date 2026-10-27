#!/usr/bin/env python3
"""Show CS 6120 progress and what to work on next, based on learning/progress.md."""
import re
from pathlib import Path

PROGRESS = Path(__file__).with_name("progress.md")
ITEM = re.compile(r"^- \[([ x~])\] (\S+) (.*)$")


def main():
    lesson, rows = None, []
    for line in PROGRESS.read_text().splitlines():
        if line.startswith("## ") and not line.startswith("## Session"):
            lesson = line[3:]
        elif m := ITEM.match(line):
            rows.append((lesson, *m.groups()))

    done = sum(r[1] == "x" for r in rows)
    print(f"Overall: {done}/{len(rows)} subsections done ({100 * done // len(rows)}%)\n")

    for name in dict.fromkeys(r[0] for r in rows):
        items = [r for r in rows if r[0] == name]
        d = sum(r[1] == "x" for r in items)
        bar = "#" * d + "-" * (len(items) - d)
        print(f"  [{bar:<14}] {d:>2}/{len(items):<2} {name}")

    in_progress = [r for r in rows if r[1] == "~"]
    todo = [r for r in rows if r[1] == " "]
    if in_progress:
        print("\nIn progress:")
        for r in in_progress:
            print(f"  {r[2]:<6} {r[3]}")
    if todo:
        print("\nUp next:")
        for r in todo[:3]:
            print(f"  {r[2]:<6} {r[3]}   ({r[0]})")
    else:
        print("\nAll done. Congratulations!")


if __name__ == "__main__":
    main()
