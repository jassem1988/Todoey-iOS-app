//
//  Item.swift
//  Todoey
//
//  Created by Jassem Al-Buloushi on 4/28/19.
//  Copyright © 2019 Jassem Al-Buloushi. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var done: Bool = false
    
    //Inverse Relationship
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
    
    
}
