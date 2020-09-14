//
//  Request.swift
//  WUApp
//
//  Created by dengchunni on 20-9-11.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation

struct Message: Codable {
    var url: String
    var data: String?
    var onSuccess: String?
    var onError: String?
    
    //var isCallback: Bool
    //var context: Context
}


class Request {
    static let clientHandler = "goui.receive"
    
    class func receive(msg: String) {
        guard let msg = JSON.fromJSON(Message.self, msg) else {return}
        let (handler,params) = Router.dispatch(msg.url)
        
        let context:Context = Context(msg, params)
        
        if let h = handler {
            h(context)
        } else {
            context.error("Function not found")
        }
    }
    
    class func send(msg: Message) {
        guard let m = JSON.toJSON(msg) else {
            return
        }
        
        WUApp.mainWindow!.evaluateJS("\(clientHandler)(\(m))")
    }
}
