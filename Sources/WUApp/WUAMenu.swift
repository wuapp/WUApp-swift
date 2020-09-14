//
//  Menu.swift
//  WUApp
//
//  Created by dengchunni on 20-9-1.
//  Copyright © 2020 Chunni. All rights reserved.
//

import Foundation
import Cocoa

class CustomAction {
    @objc func action(_ sender: Any) {
        print("Menu clicked:",sender)
    }
    
}

enum MenuType: Int {
    case Container
    case Standard
    case Custom
    case Seprator
}


struct MenuDef {
    var menuType: MenuType
    var title: String
    var action: String
    var toolTip: String
    var target: NSObject?
    var hotKey: String
    var children: [MenuDef]
}

class WUAMenu {
    lazy var customAction = CustomAction()
    
    func buildMenu(menuDefs: [MenuDef] ) -> NSMenu {
        let menu = NSMenu()
        buildSub(parent: menu, defs: menuDefs)
        return menu
    }
    
    func buildSub(parent: NSMenu,defs: [MenuDef]) {
        for def in defs {
            switch def.menuType {
            case .Container:
                parent.addItem(createMenu(def: def))
            case .Seprator:
                parent.addItem(NSMenuItem.separator())
            default:
                parent.addItem(createMenuItem(def: def))
            }
        }
    }
    
    func createMenuItem(def: MenuDef) -> NSMenuItem {
        var act: Selector?
        if(def.menuType == .Standard) {
            act = Selector(def.action)
        }
        
        let item = NSMenuItem(title: def.title,action: act,keyEquivalent: def.hotKey)
        if(def.menuType == .Custom) {
            item.target = customAction
            item.representedObject = def.action
        }
        return item
    }
    
    func createMenu(def: MenuDef) -> NSMenuItem {
        let menu = NSMenu(title: def.title)
        let item = self.createMenuItem(def: def)
        item.submenu = menu
        buildSub(parent: menu, defs: def.children)
        return item
    }
    
}
