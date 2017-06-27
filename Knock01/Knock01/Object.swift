//
//  Object.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/05/01.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//
import RealmSwift

extension Object {
    
    func add() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.add(self)
        }
    }
    
    func update(updateBlock: () -> ()) {
        let realm = try? Realm()
        try! realm?.write(updateBlock)
    }
    
    func delete() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.delete(self)
        }
    }
}
