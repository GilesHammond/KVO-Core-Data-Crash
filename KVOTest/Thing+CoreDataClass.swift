//
//  Thing+CoreDataClass.swift
//  KVOTest
//
//  Created by Giles on 05/11/2019.
//  Copyright © 2019 Explore and Create Limited. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Thing)
public class Thing: NSManagedObject
{
    override public func awakeFromFetch() {
        super.awakeFromFetch()
        print("\(hosts)") // Initialise lazy member and set observation
    }

    public override func willTurnIntoFault() {
        super.willTurnIntoFault()
        hostsObservation = nil // <-- EXC_BAD_ACCESS
    }

    @objc dynamic public internal(set) lazy var hosts: [Connection] = {
        hostsObservation = observe(\.connections) { [unowned self] data, change in } // Empty observation closure
        return []
    }()

    private var hostsObservation: NSKeyValueObservation?

}
