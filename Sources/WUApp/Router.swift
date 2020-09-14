//
//  Router.swift
//  WUApp
//
//  Created by dengchunni on 20-9-7.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation

typealias RouteHandle = (Context)->()

struct Route {
    var handle: RouteHandle?
    var paramNames: [String]? //named parameters
    var paramPattern:String? //if there are parameters
}

class Router {
    static let namedPartPattern = #":([^/]+)"#
    static let escapePattern = #"([\-{}\[\]+?.,\\\^$|#\s])"#
    static let replacementPattern = #"([^/]+)"#

    static var routes = [String:Route]()
    
    static func parse(pattern: String, route: inout Route) {
        let params = pattern.findAllWithGroup(namedPartPattern)
        if !params.isEmpty {
            route.paramNames = [String]()
            for p in params {
                route.paramNames!.append(p[1])
            }
            route.paramPattern = pattern.replace(namedPartPattern, replacement: replacementPattern)
        }
        routes[pattern] = route
    }
    
    static func dispatch(_ url: String) -> (RouteHandle?, [String:String]?) {
        for (pattern, route) in routes {
            if let paramPattern = route.paramPattern {
                let matches = url.findAllWithGroup(paramPattern)
                if let paramVals = matches.first {
                    if let paramNames = route.paramNames {
                        let paramNamesCount = paramNames.count
                        if paramNamesCount == paramVals.count - 1 {
                            var params = [String:String]()
                            for i in 0..<paramNamesCount {
                                params[paramNames[i]] = paramVals[i+1]
                            }
                            return (route.handle,params)
                        }
                    }
                }
            } else  {
                if pattern == url {
                    return (route.handle,nil)
                }
            }
        }
        return (nil,nil)
    }
    
}
