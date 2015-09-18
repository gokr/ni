import ni, niparser, python

proc primPython*(ni: Interpreter): Node =
  Py_Initialize()
  discard PyRun_SimpleString(StringVal(evalArg(ni)).value)
  Py_Finalize()

# This proc does the work extending an Interpreter instance
proc extendInterpreter(ni: Interpreter) {.procvar.} =
  discard ni.root.makeBinding("python", newNimProc(primPython, false, 1))
  
addInterpreterExtension(extendInterpreter)

