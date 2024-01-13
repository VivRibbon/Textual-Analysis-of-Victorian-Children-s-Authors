import os, strutils

proc checkFile(file: string) =
  var count = 0
  let f = readFile(file)
  for word in f.normalize().split():
    if word in ["game", "games", "math", "logic", "number", "numbers", "chess", "checker", "checkers", "maths", "puzzle", "puzzles", "arithmetic", "algebra", "geometry", "calculus"]:
      inc count
  echo count, "\n"

proc dispatchReader(path: string) =
  for file in walkDirRec(path):
    echo file.split("/")[8], ": ", file.splitFile[1]
    checkFile(file)

dispatchReader(paramStr(1).absolutePath)
