//
//  RealmHelper.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/05/06.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import RealmSwift

class RealmHelper {
    static func objects<T: Object>(type: T.Type) -> Results<T>? {
        let realm = try? Realm()
        return realm?.objects(T)
    }
}
