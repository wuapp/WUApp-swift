//
//  Context.swift
//  WUApp
//
//  Created by dengchunni on 20-9-7.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation

public class Context {
    var msg: Message
    var params: [String:String]?
    
    init(_ msg:Message,_ params:[String:String]?) {
        self.msg = msg
        self.params = params
    }
    
    public func getParam(_ name: String) -> String? {
        return params?[name]
    }
    
    public func getParam(_ name: String,defaultVal: String) -> String {
        return params?[name] ?? defaultVal
    }
    
    public func getUnescapedParam(_ name: String) -> String? {
        return nil
    }
    
    public func getBoolParam(_ name: String) -> Bool? {
        guard let s = params?[name] else { return nil }
        return Bool(s)
    }
    
    public func getBoolParam(_ name: String, defaultVal: Bool) -> Bool {
        if let s = params?[name] {
            return Bool(s) ?? defaultVal
        }
        
        return defaultVal
    }
    
    public func getIntParam(_ name: String) -> Int? {
        guard let s = params?[name] else { return nil }
        return Int(s)
    }
    
    public func getBoolParam(_ name: String, defaultVal: Int) -> Int {
        if let s = params?[name] {
            return Int(s) ?? defaultVal
        }
        
        return defaultVal
    }
    
    public func getFloatParam(_ name: String) -> Float? {
        guard let s = params?[name] else { return nil }
        return Float(s)
    }
    
    public func getBoolParam(_ name: String, defaultVal: Float) -> Float {
        if let s = params?[name] {
            return Float(s) ?? defaultVal
        }
        
        return defaultVal
    }
    
    public func getEntity<T:Decodable>() -> T? {
        guard let d = msg.data else {return nil}
        return JSON.fromJSON(T.self, d)
    }
    
    public func success(_ feedback: Any...) {
        if let f = msg.onSuccess {
            WUApp.mainWindow?.evaluateJS(funcName: f, params: feedback)
        }
    }
    
    public func error(_ feedback: Any...) {
        if let f = msg.onError {
            WUApp.mainWindow?.evaluateJS(funcName: f, params: feedback)
        }
    }
    
}
