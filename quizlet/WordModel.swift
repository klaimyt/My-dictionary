//
//  WordModel.swift
//  quizlet
//
//  Created by Иван Клименков on 13.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//
 import RealmSwift

class Word: Object {
    @objc dynamic var firstLabguageWord = ""
    @objc dynamic var secondLanguageWord = ""
}
