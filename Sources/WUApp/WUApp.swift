import Foundation
import Cocoa

public final class WUApp {
    internal static var mainWindow: Window?
    
    class func run(windowSettings: WindowSettings?) {
        let appDelegate = AppDelegate()
        NSApp = NSApplication.shared
        NSApp.setActivationPolicy(.regular)
        NSApp.delegate = appDelegate
        mainWindow = Window()
        mainWindow!.create(windowSettings:windowSettings)
        NSApp.run()
    }
    
    class func run(windowSettings: WindowSettings?, menuDefs: [MenuDef]?) {
        let appDelegate = AppDelegate()
        appDelegate.menuDefs = menuDefs
        NSApp = NSApplication.shared
        NSApp.setActivationPolicy(.regular)
        NSApp.delegate = appDelegate
        mainWindow = Window()
        mainWindow!.create(windowSettings:windowSettings)
        NSApp.run()
    }
}
