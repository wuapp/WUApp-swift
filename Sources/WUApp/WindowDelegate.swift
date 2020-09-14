//
//  WindowDelegate.swift
//  WUApp
//
//  Created by dengchunni on 20-9-1.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation
import Cocoa

class WindowDelegate : NSObject,NSWindowDelegate  {
    //NSView view;
    func windowWillClose(_ notification: Notification) {
        NSApp.terminate(NSApp)
    }
    
    func windowDidMove(_ notification: Notification) {
        
    }
    
    func windowDidResize(_ notification: Notification) {
        
    }
    
    func windowDidBecomeMain(_ notification: Notification) {
        
    }
    
    func windowDidBecomeKey(_ notification: Notification) {
        
    }
    
    func windowDidResignKey(_ notification: Notification) {
        
    }
}
