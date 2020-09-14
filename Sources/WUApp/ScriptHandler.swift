//
//  ScriptHandler.swift
//  WUApp
//
//  Created by dengchunni on 20-9-1.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation
import WebKit

//typealias OnScriptReceived = (String)->()

class ScriptHandler: NSObject,WKScriptMessageHandler {
    static let handlerName = "wuapp"
    
    //var handler: OnScriptReceived?
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == ScriptHandler.handlerName) {
            let body = message.body as? String
            if let msg = body {
                print("received: ",msg)
                /* dispatch
                 if let f = handler {
                    f(msg)
                }*/
            }
        }
    }
}
