//
//  Data.swift
//  Todoey
//
//  Created by Serhii Onyshchenko on 21.07.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
