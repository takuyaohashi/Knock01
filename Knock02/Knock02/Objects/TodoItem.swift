//
//  TodoItem.swift
//  Knock02
//
//  Created by Takuya OHASHI on 2017/07/08.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import Foundation
import RealmSwift

final class ItemList : Object {
    let items = List<TodoItem>()
}

final class TodoItem : Object {
    dynamic var title: String = ""
    dynamic var done: Bool    = false
}
