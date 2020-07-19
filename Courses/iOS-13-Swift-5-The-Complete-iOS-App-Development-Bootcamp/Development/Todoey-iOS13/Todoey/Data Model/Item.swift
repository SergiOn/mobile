//
//  Item.swift
//  Todoey
//
//  Created by Serhii Onyshchenko on 19.07.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

class Item: Encodable {
    var title: String = ""
    var done: Bool = false
}
