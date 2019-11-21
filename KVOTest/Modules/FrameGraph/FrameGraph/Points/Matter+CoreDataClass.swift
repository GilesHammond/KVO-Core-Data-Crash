//
//  Matter+CoreDataClass.swift
//  
//
//  Created by Giles on 28/10/2019.
//
//

import Foundation
import CoreData

public class Matter: Point
{
    // MARK: Initialisation

    public override func willTurnIntoFault() {
        hostsObservation?.invalidate()
        hostsObservation = nil
        super.willTurnIntoFault()
    }
    
    deinit {
        hostsObservation?.invalidate()
        hostsObservation = nil
    }
    
    @objc dynamic public var hosts: [Point] {
       hostsObservation = observe(\Matter.subs) { [unowned self] _, _ in }
       return []
    }
    
    private var hostsObservation: NSKeyValueObservation?
}
