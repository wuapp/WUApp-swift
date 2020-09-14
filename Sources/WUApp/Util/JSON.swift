//
//  JSON.swift
//  WUApp
//
//  Created by dengchunni on 20-9-10.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation

public class JSON {
    static func fromJSON<T: Decodable>(_ type:T.Type, _ jsonStr: String) -> T? {
        let data = jsonStr.data(using: .utf8)
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: data!)
    }
    
    static func toJSON<T:Encodable>(_ val:T) -> String? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(val) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    static func test(p: Any...) -> String {
        p.join(",", prefix: "(", suffix: ")",quote:"\"")
    }
}
