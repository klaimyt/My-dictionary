//
//  WordModel.swift
//  quizlet
//
//  Created by Иван Клименков on 13.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//
 import RealmSwift

class Word: Object {
    @objc dynamic var firstLanguageWord = ""
    @objc dynamic var secondLanguageWord = ""
    
    convenience init(firstLanguageWord: String, secondLanguageWord: String) {
        self.init()
        self.firstLanguageWord = firstLanguageWord
        self.secondLanguageWord = secondLanguageWord
    }
}
