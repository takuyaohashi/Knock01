//
//  Item.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/04/30.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//
import RealmSwift

class Item: Object {
    dynamic var title = ""
    dynamic var desc: String? = nil
    dynamic var date = NSDate()
    dynamic var done = false
}
