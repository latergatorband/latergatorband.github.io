import panflute as pf
import re
import sys
from typing import List, Optional

def debug(string: str):
  sys.stderr.write(string + "\n")

def writeColumn(strings: List[str], str_num: int, val: str):
  for idx, _ in enumerate(strings):
    if idx == str_num:
      strings[idx] += val
    else:
      strings[idx] += "─"

def writeChord(strings: List[str], chord: List[str]):
  for i in range(len(strings)):
    if chord[i] == "":
      strings[i] += "─"
    else:
      strings[i] += chord[i]

def formatTuningVal(val: str):
  return val.upper().ljust(2)

def startLine(tuning: List[str]) -> List[str]:
  strings = [""] * len(tuning)
  strings[0] = formatTuningVal(tuning[0]) + " ╭─"
  for i in range(1, len(tuning) - 1):
    strings[i] = formatTuningVal(tuning[i]) + " │─"
  strings[len(tuning) - 1] = formatTuningVal(tuning[-1]) + " ╰─"
  return strings

def endLine(strings: List[str]):
  for i in range(1, len(strings) - 1):
    strings[i] += "─│"
  strings[0] += "─╮"
  strings[-1] += "─╯"

def isFlankedByNumber(line: str, idx: int) -> Optional[str]:
  next_char = line[idx + 1] if idx + 1 < len(line) else None
  next_is_num = re.match(r'(\d)', next_char) if next_char else False

  prev_char = line[idx - 1] if idx > 1 else None
  prev_is_num = re.match(r'(\d)', prev_char) if prev_char else False
  prev_prev_char = line[idx - 2] if idx > 2 else None
  prev_prev_is_string = prev_prev_char == "$" if prev_prev_char else True
  return (not prev_prev_is_string) and prev_is_num and next_is_num

def parseJtab(jtab: str, tuning: List[str]):
  lines = jtab.splitlines()
  output = []
  for line in lines:
    strings = startLine(tuning)

    on_set_str_num = True
    cur_str_num = 0
    chord = None
    writingChord = False
    for idx, char in enumerate(line):
      # debug(f"{char} {writingChord} {on_set_str_num} {cur_str_num} {chord}")
      if writingChord:
        if char == ".":
          continue
        elif on_set_str_num:
          cur_str_num = int(char) - 1
          on_set_str_num = False
        elif char == " ":
          # Done writing the chord
          writeChord(strings, chord)
          writeColumn(strings, cur_str_num, "─")
          writingChord = False
        elif char == "$":
          on_set_str_num = True
        else:
          chord[cur_str_num] += char
      elif char == "$":
        on_set_str_num = True
      elif on_set_str_num and char == " ":
        continue
      elif on_set_str_num:
        cur_str_num = int(char) - 1
        on_set_str_num = False
      elif char == ".":
        writingChord = True
        chord = [""] * len(tuning)
      elif char == " " and isFlankedByNumber(line, idx):
        writeColumn(strings, cur_str_num, "-") # normal hyphen when between numbers for legibility
      elif char == " ":
        writeColumn(strings, cur_str_num, "─")
      else:
        writeColumn(strings, cur_str_num, char)

    if writingChord:
      # if we end the line with a chord, we need to manually write it now
      writeChord(strings, chord)
    endLine(strings)

    output.append(pf.CodeBlock("\n".join(strings) + "\n"))

  return output

def action(elem, doc):
  if isinstance(elem, pf.CodeBlock):
    match = None
    for c in elem.classes:
      match = re.search(r'jtab-(.*)', c)
    if match:
      tuning = match.group(1).split('-')
      tuning.reverse()

      div = pf.Div(classes=["jtab"])
      div.content.extend(parseJtab(elem.text, tuning))
      return div

if __name__ == "__main__":
  pf.run_filter(action, doc=None)