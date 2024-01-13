# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import os, sequtils, strutils

proc checkFile(file: string) =
  var count = 0
  let f = readFile(file)
  for i in f.normalize().split():
    if i in ["game", "games", "math", "logic", "number", "numbers", "chess", "checker", "checkers", "maths", "puzzle", "puzzles", "arithmetic", "algebra", "geometry", "calculus"]:
      inc count
  echo count, "\n"

proc dispatchReader(path: string) =
  for i in walkDirRec(path):
    echo i.split("/")[8], ": ", i.splitFile[1]
    checkFile(i)

dispatchReader(paramStr(1).absolutePath)
