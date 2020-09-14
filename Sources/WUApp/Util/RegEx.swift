//
//  Regex.swift
//  WUApp
//
//  Created by dengchunni on 20-9-8.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation

public extension String {
    subscript(_ range: NSRange) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
    
    func doesMatch(_ pattern: String) -> Bool {
        return self.range(of: pattern, options: .regularExpression) != nil
    }
    
    func findAll(_ pattern: String) -> [String] {
        let reg = try? NSRegularExpression(pattern: pattern, options: [])
        
        return reg?.matches(in: self, options: [], range: NSRange(location: 0,length: self.count)).map {self[$0.range]} ?? []
    }
    
    func findFirst(_ pattern: String) -> String? {
        if let range = self.range(of: pattern, options: .regularExpression) {
            return String(self[range])
        } else {
            return nil
        }
    }
    
    func replace(_ pattern: String,replacement: String) -> String {
        return self.replacingOccurrences(of: pattern, with: replacement, options: .regularExpression, range: nil)
    }
    
    func replaceFirst(_ pattern: String) -> String {
        return ""
    }
    
    func findAllWithGroup(_ pattern: String) -> [[String]] {
        let reg = try? NSRegularExpression(pattern: pattern, options: [])
        
        let matches = reg?.matches(in: self, options: [], range: NSRange(location: 0,length: self.count))
        var result = [[String]]()
        
        guard (matches?.first) != nil else {
            return result
        }
        
        for m in matches! {
            let num = m.numberOfRanges
            var sub = [String]()
            for i in 0..<num {
                sub.append(self[m.range(at: i)])
            }
            result.append(sub)
        }
        return result
    }
}
