//
//  Category.swift
//  Todoey
//
//  Created by Jassem Al-Buloushi on 4/28/19.
//  Copyright © 2019 Jassem Al-Buloushi. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    
    //Forward Relationship
    let items = List<Item>()
}
