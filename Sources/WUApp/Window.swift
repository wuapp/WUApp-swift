//
//  Window.swift
//  WUApp
//
//  Created by dengchunni on 20-9-1.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation
import WebKit

public struct WindowSettings {
    var title = "WUApp"
    var index = "index.html"
    var dir = "ui"
    var left = 0
    var top = 0
    var width = 300
    var height = 300
    var resizable = true
    var closable = true
    var miniaturizable = true
    var borderless = false
    var fullScreen = false
    var fullSizeContentView = true
    
}

class Window {
    private var webview:WKWebView = WKWebView()
    
    func create(windowSettings: WindowSettings?) {
        var settings: WindowSettings
        
        if(windowSettings == nil) {
            settings = WindowSettings()
        } else {
            settings = windowSettings!
        }
        
        let delegate = WindowDelegate()
        let rect = CGRect(x: settings.left,y: settings.top,width: settings.width,height: settings.height)
        var mask:NSWindow.StyleMask  = []
        if(settings.resizable) {
            mask.insert(.resizable)
        }
        if(settings.closable) {
            mask.insert(.closable)
        }
        if(settings.miniaturizable) {
            mask.insert(.miniaturizable)
        }
        if(settings.borderless) {
            mask.insert(.borderless)
        }
        if(settings.fullScreen) {
            mask.insert(.fullScreen)
        }
        if(settings.fullSizeContentView) {
            mask.insert(.fullSizeContentView)
        }
        let window = NSWindow(contentRect: rect,
                                styleMask: mask,
                                  backing: NSWindow.BackingStoreType.buffered,
                                  defer: false)
        window.delegate = delegate
        window.title = settings.title
        
        createWebView(rect: rect,settings.dir,settings.index)
        
        window.contentView?.addSubview(webview)
        
        window.makeKeyAndOrderFront(nil)
    }
    
    func createWebView(rect: NSRect,_ dir: String,_ index: String)  {
        //let webConfig = WKWebViewConfiguration()
        //webview = WKWebView(frame: rect)
        //webview.frame = rect
        webview = WKWebView(frame: CGRect(x: 0,y: 0,width: rect.width,height: rect.height))
        let webConfig = webview.configuration
        webConfig.preferences.setValue(true, forKey: "developerExtrasEnabled")
        let contentController = webConfig.userContentController
        contentController.add(ScriptHandler(), name: ScriptHandler.handlerName)
        
        let bundleUrl = Bundle.main.bundleURL
        let dirUrl = URL(fileURLWithPath: dir, isDirectory: true, relativeTo: bundleUrl)
        let url = URL(fileURLWithPath: index, isDirectory: false, relativeTo: dirUrl)
        webview.loadFileURL(url, allowingReadAccessTo: dirUrl)
    }
    
    func evaluateJS(_ js:String)  {
        webview.evaluateJavaScript(js, completionHandler:nil)
    }
    
    func evaluateJS(funcName: String, params:Any...) {
        let js = funcName + params.join(",", prefix: "(", suffix: ")",quote: "\"")
        webview.evaluateJavaScript(js, completionHandler:nil)
    }
    /*
    internal convenience init?(delegate:WindowDelegate) {
        
        //let app = Application(delegate:ApplicationDelegate())
        self.init(delegate: delegate/*,appliation:app*/)
    }*/
}
