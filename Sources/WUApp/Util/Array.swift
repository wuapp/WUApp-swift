//
//  Array.swift
//  WUApp
//
//  Created by dengchunni on 20-9-10.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation

extension Array {
    func join(_ seprator: String, prefix: String = "", suffix: String = "") -> String {
        prefix + self.map({"\($0)"}).joined(separator: seprator) + suffix
    }
    
    func join(_ seprator: String, prefix: String = "", suffix: String = "", quote: String) -> String {
        prefix + self.map({toString(val: $0,quote: quote)}).joined(separator: seprator) + suffix
    }
    
    func toString(val: Any, quote: String) -> String {
        if let s = val as? String {
            return quote+s+quote
        }
        return "\(val)"//String(val)
    }
    
}
