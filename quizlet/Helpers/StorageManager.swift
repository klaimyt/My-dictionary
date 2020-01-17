//
//  StorageManager.swift
//  quizlet
//
//  Created by Иван Клименков on 13.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ word: Word) {
        
        try! realm.write {
            realm.add(word)
        }
    }
    
    static func deleteObject(_ word: Word) {
        
        try! realm.write {
            realm.delete(word)
        }
    }
}
