#!/usr/bin/python

import os
import subprocess
import lldb
import json
import requests

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand("command script add -f " + __name__ + ".remote_trace rt")
    rpc_call("reset", None)
    
    print 'Use "rt" command in the same manner as you would po, to inspect the object via remote inspector.'
    
def remote_trace(debugger, command, result, internal_dict):
    thread = debugger.GetSelectedTarget().GetProcess().GetSelectedThread()
    frame = thread.GetSelectedFrame()
    addr = frame.addr
    ln = addr.line_entry
    
    data = {"pc": frame.pc, "stackp": frame.sp, "file": ln.file.fullpath, "line": ln.line}
    
    module = frame.module
    if module.num_symbols > 0:
        data["module"] = module.symbols[0].name
    
    function = frame.function
    if function.name != None:
        data["function"] = function.name
        
    lang = lldb.SBLanguageRuntime.GetNameForLanguageType(frame.compile_unit.GetLanguage())
    if lang != None:
        data["language"] = lang
        
    variables = frame.variables
    varInfos = []
    for var in variables:
        varInfos.append({"name": var.name, "type": var.GetTypeName(), "value": var.summary})
    data["variables"] = varInfos
    
    arguments = frame.arguments
    argInfos = []
    for arg in arguments:
        argInfos.append({"name": arg.name, "type": arg.GetTypeName(), "value": arg.summary})
    data["arguments"] = argInfos
    
    rpc_call("trace", data)
    
    
#==== Utils =====#
    
def rpc_call(method, value):
    payload = {"jsonrpc": "2.0", "id": 1, "method": method, "params": value}
    jsPayload = json.dumps(payload)
    print(jsPayload)
    url = "http://localhost:16164/api/jsonrpc"
    content_type = "application/json"
    req = requests.post(url, json=jsPayload)
        
def eval_print_json(frame, command):
    expr = [
        "var $data = JSONSerialization.data(withJSONObject: [("+command+")], options: JSONSerialization.WritingOptions(rawValue: 0))",
        "var $result = String(data: $data, encoding: String.Encoding.utf8)",
        "$result?.removeFirst(1)",
        "$result?.removeLast(1)",
        "print $result"
    ]
    return frame.EvaluateExpression("; ".join(expr))