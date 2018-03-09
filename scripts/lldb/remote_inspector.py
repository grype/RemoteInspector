#!/usr/bin/python

import os
import subprocess
import lldb
import json

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand("command script add -f " + __name__ + ".remote_inspect ri")
    debugger.HandleCommand("command script add -f " + __name__ + ".remote_reset rr")
    debugger.HandleCommand("command script add -f " + __name__ + ".print_json pj")
    rpc_call("reset", None)
    
    print 'Use "ri" command in the same manner as you would po, to inspect the object via remote inspector.'

def remote_inspect(debugger, command, result, internal_dict):
    frame = debugger.GetSelectedTarget().GetProcess().GetSelectedThread().GetSelectedFrame()
    value = frame.EvaluateExpression("print " + command).summary
    #value = eval_print_json(frame, command).summary
    rpc_call("inspect", [ command, value ])
    
def remote_reset(debugger, command, result, internal_dict):
    rpc_call("reset", None)
    
def rpc_call(method, value):
    payload = {"jsonrpc": "2.0", "id": 1, "method": method}
    payload["params"] = value
    #subprocess.call(["syslog", "-s", "-l", "notice", "curl", "-H", "Content-Type: application/json", "http://localhost:16164/api/jsonrpc", "-d", json.dumps(payload)])
    subprocess.call(["curl", "-H", "Content-Type: application/json", "http://localhost:16164/api/jsonrpc", "-d", json.dumps(payload,separators=(',',':'))])

def print_json(debugger, command, result, internal_dict):
    frame = debugger.GetSelectedTarget().GetProcess().GetSelectedThread().GetSelectedFrame()
    result = eval_print_json(frame, command) 
    print result.summary
        
def eval_print_json(frame, command):
    expr = [
        "var $data = JSONSerialization.data(withJSONObject: [("+command+")], options: JSONSerialization.WritingOptions(rawValue: 0))",
        "var $result = String(data: $data, encoding: String.Encoding.utf8)",
        "$result?.removeFirst(1)",
        "$result?.removeLast(1)",
        "print $result"
    ]
    return frame.EvaluateExpression("; ".join(expr))
