//
//  AppDelegate.swift
//  Axiom
//
//  Created by Andrew Hong on 9/13/20.
//  Copyright © 2020 Raonpia. All rights reserved.
//

import Foundation
import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
//    var screen: NSScreen!
//    var dock: NSDockTile!
    
    // Get Dock Info
    // https://gist.github.com/wonderbit/c8896ff429a858021a7623f312dcdbf9
    
    enum WBDockPosition: Int {
        case bottom = 0
        case left = 1
        case right = 2
    }
    
    func getDockPosition() -> WBDockPosition {
        if NSScreen.main!.visibleFrame.origin.y == 0 {
            if NSScreen.main!.visibleFrame.origin.x == 0 {
                return .right
            } else {
                return .left
            }
        } else {
            return .bottom
        }
    }
    
    func getDockSize() -> (NSRect) {
        let dockPosition = getDockPosition()
        let screenSize: NSRect = NSScreen.main!.frame
        
        switch dockPosition {
        case .right:
            let size = NSScreen.main!.frame.width - NSScreen.main!.visibleFrame.width
            print("Right")
            return NSRect(x: screenSize.minX, y: screenSize.minY, width: screenSize.width - size, height: screenSize.height)
            
        case .left:
            let size = NSScreen.main!.visibleFrame.origin.x
            print("Left")
            return NSRect(x: screenSize.minX, y: screenSize.minY, width: screenSize.width - size, height: screenSize.height)
            
        case .bottom:
            let size = NSScreen.main!.visibleFrame.origin.y
            print("Bottom")
            return NSRect(x: screenSize.minX, y: screenSize.minY, width: screenSize.width / 2, height: (screenSize.height - size) / 2)
//            return NSRect(x: screenSize.minX, y: screenSize.minY, width: screenSize.width , height: (screenSize.height - size))
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        
        // Get the Full screen size
//        let screenSize: NSRect = NSScreen.main!.frame
//
//        let reducedSize: NSRect = NSRect(x: screenSize.minX, y: screenSize.minY, width: screenSize.width, height: screenSize.height - 13.0)
        
        
        // Create the window and set the content view.
        window = NSWindow(
            contentRect: getDockSize(),    //  NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [
                .titled,
                
                .closable,
                .miniaturizable,
                .fullSizeContentView,
                .resizable,
                
                .borderless,
            ],
            backing: .buffered, defer: false)
        
        window.center()
        
        //  Cache the frame size
        //  window.setFrameAutosaveName("Main Window")
        
        
        //  Transparent Mode
        window.isOpaque = false
        window.backgroundColor = .clear
        
        
        window.contentView = NSHostingView(rootView: contentView)
        
        window.makeKeyAndOrderFront(nil)
        
//        let preferredContentSize = view.frame.size
        
        
        
        
        
        
        
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

