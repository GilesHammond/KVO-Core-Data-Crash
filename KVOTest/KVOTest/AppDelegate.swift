//
//  AppDelegate.swift
//  KVOTest
//
//  Created by Giles on 05/11/2019.
//  Copyright © 2019 Explore and Create Limited. All rights reserved.
//

import Cocoa
import FrameGraph

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        graph = Graph.shared
        getSubjects()
    }
    
    var graph: Graph?
    
    var subjects: [Subject]?
    
    @IBAction public func getSubjects(_ sender: Any? = nil)
    {
        subjects = graph?.randomSubjects
        
        for subject in subjects! {
            let hosts = subject.hosts
        }
    }
}

