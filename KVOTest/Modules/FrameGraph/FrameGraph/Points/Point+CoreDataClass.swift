//
//  Point+CoreDataClass.swift
//  
//
//  Created by Giles on 28/10/2019.
//
//

import Foundation
import CoreData

public class Point: NSManagedObject
{
    public var linkedTitle = NSAttributedString()
    
    @objc dynamic public var subs: [Point] = []
}
