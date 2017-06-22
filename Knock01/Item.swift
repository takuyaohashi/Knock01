//
//  Item.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/04/30.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//
import RealmSwift

class ItemList: Object {
    dynamic var id = ""
    let items = List<Item>()

    override class func primaryKey() -> String {
        return "id"
    }
}

class Item: Object {
    dynamic var title = ""
    dynamic var done = false
}
