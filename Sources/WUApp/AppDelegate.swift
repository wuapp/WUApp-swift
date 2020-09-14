//
//  AppDelegate.swift
//  
//
//  Created by dengchunni on 20-9-14.
//

import Foundation
import Cocoa

final class AppDelegate: NSObject, NSApplicationDelegate {
    var menuDefs: [MenuDef]? = nil
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        if let defs = menuDefs {
            let menu = WUAMenu().buildMenu(menuDefs: defs)
            NSApp.mainMenu = menu
        }
        NSApp.setActivationPolicy(NSApplication.ActivationPolicy.regular)
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("did finished")
        NSApp.activate(ignoringOtherApps: true)
    }
}
